import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:trust_wallet_core/protobuf/ethereum.pb.dart' as ethereum;
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/common/utils.dart';
import 'package:trust_wallet_core_example/data/abstractions/base_blockchain_wallet.dart';
import 'package:trust_wallet_core_example/data/model/result.dart';

//TODO: change to prod url
// const String _url = 'https://rpc.ankr.com/eth';
const String _url = 'https://rpc.ankr.com/eth_holesky';

final class EthereumWallet extends BaseBlockchainWallet {
  final InterceptedHttp _http;

  const EthereumWallet({
    required super.hdWallet,
    required InterceptedHttp http,
  }) : _http = http;

  @override
  Future<double> getBalance() async {
    final addressEth = getAddressForCoin(CoinType.ethereum);

    try {
      final response = await _sendRequest({
        'jsonrpc': '2.0',
        'method': 'eth_getBalance',
        'params': [addressEth, 'latest'],
        // TODO: get response ID
        'id': 1,
      });

      if (response.statusCode == 200) {
        final result = Result.fromJson(jsonDecode(response.body)).result;

        final balanceWei = BigInt.parse(result.substring(2), radix: 16);

        // In Ethereum, the smallest unit of the currency is called wei.
        // One ether (ETH) is equal to ten to the power of eighteen wei.
        // Therefore, to convert a balance from wei to ether, you need to divide it by ten to the power of eighteen.
        final balanceEth = balanceWei / BigInt.from(10).pow(18);

        return balanceEth;
      } else {
        throw Exception('Failed to load balance ${response.reasonPhrase}');
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendTransaction({required String toAddress, required String amount}) async {
    final addressEth = getAddressForCoin(CoinType.ethereum);

    try {
      // Receive nonce
      final nonceResponse = await _sendRequest({
        'jsonrpc': '2.0',
        'method': 'eth_getTransactionCount',
        'params': [addressEth, 'latest'],
        // TODO: get response ID
        'id': 1,
      });

      if (nonceResponse.statusCode == 200) {
        final nonceResult = Result.fromJson(jsonDecode(nonceResponse.body)).result;

        final nonce = _bigIntToUint8List(BigInt.parse(nonceResult.substring(2), radix: 16));

        // Returns the current price per gas in wei.
        final gasPriceResponse = await _sendRequest({
          'jsonrpc': '2.0',
          'method': 'eth_gasPrice',
          'params': [],
          'id': 1,
        });

        if (gasPriceResponse.statusCode == 200) {
          final gasPriceResult = Result.fromJson(jsonDecode(gasPriceResponse.body)).result;

          final privateKeyEth = getKeyForCoin(CoinType.ethereum).toList();
          final gasPrice = _bigIntToUint8List(BigInt.parse(gasPriceResult));
          final gasLimit = _intToUint8List(21000);

          // Минимальный gas limit для простой транзакции
          // 1 ETH in Wei
          final amountInWei = Utils.valueToMinUnit(double.parse(amount), 18);

          final transaction = ethereum.Transaction(
            transfer: ethereum.Transaction_Transfer(
              amount: _bigIntToUint8List(amountInWei),
            ),
          );

          final chainId = _bigIntToUint8List(BigInt.parse('0x4268')); // TestNet

          final signedTransaction = ethereum.SigningInput(
            chainId: chainId,
            gasPrice: gasPrice,
            gasLimit: gasLimit,
            toAddress: toAddress,
            transaction: transaction,
            privateKey: privateKeyEth,
            nonce: nonce,
          );

          final sign = AnySigner.sign(
            signedTransaction.writeToBuffer(),
            CoinType.ethereum,
          );
          final signingOutput = ethereum.SigningOutput.fromBuffer(sign);
          final rawTx = Utils.bytesToHex(signingOutput.encoded);

          final transactionResponse = await _sendRequest({
            'jsonrpc': '2.0',
            'method': 'eth_sendRawTransaction',
            'params': ['0x$rawTx'],
            'id': 1,
          });

          if (transactionResponse.statusCode == 200) {
            return Result.fromJson(jsonDecode(transactionResponse.body)).result;
          } else {
            throw Exception('Failed to send transaction ${transactionResponse.reasonPhrase}');
          }
        } else {
          throw Exception('Failed to send transaction ${gasPriceResponse.reasonPhrase}');
        }
      } else {
        throw Exception('Failed to send transaction ${nonceResponse.reasonPhrase}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Uint8List _bigIntToUint8List(BigInt bigInt) {
    int byteLength = (bigInt.bitLength + 7) >> 3;
    final bytes = Uint8List(byteLength);

    BigInt mask = BigInt.from(0xff);

    for (int i = 0; i < byteLength; i++) {
      // Приведение BigInt к int перед присвоением в массив Uint8List
      bytes[byteLength - i - 1] = (bigInt & mask).toInt();
      bigInt = bigInt >> 8;
    }

    return bytes;
  }

  Uint8List _intToUint8List(int value) {
    // Определяем количество байт, необходимых для представления int
    int byteLength = (value.bitLength + 7) >> 3;

    // Создаем Uint8List с нужной длиной
    final bytes = Uint8List(byteLength);

    // Заполняем массив байтами из числа
    for (int i = 0; i < byteLength; i++) {
      bytes[byteLength - i - 1] = (value >> (8 * i)) & 0xff;
    }

    return bytes;
  }

  Future<Response> _sendRequest(Map<String, Object> body) => _http.post(
        Uri.parse(_url),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
        body: jsonEncode(body),
      );
}
