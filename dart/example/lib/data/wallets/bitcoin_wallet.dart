import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:http_interceptor/http/intercepted_http.dart';
import 'package:trust_wallet_core/bindings/generated_bindings.dart' show TWCoinType;
import 'package:trust_wallet_core/protobuf/Bitcoin.pb.dart' as bitcoin;
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/common/utils.dart';
import 'package:trust_wallet_core_example/data/abstractions/base_blockchain_wallet.dart';
import 'package:trust_wallet_core_example/data/model/bitcoin_address_info.dart';
import 'package:trust_wallet_core_example/data/model/result.dart';
import 'package:trust_wallet_core_example/data/model/utxo.dart';

final class BitcoinWallet extends BaseBlockchainWallet {
  final InterceptedHttp _http;
  final String _apiUrl = 'https://rpc.ankr.com/http/btc_blockbook/api/v2/';

  const BitcoinWallet({
    required super.hdWallet,
    required InterceptedHttp http,
  }) : _http = http;

  @override
  Future<double> getBalance() async {
    try {
      final addressBtc = getAddressForCoin(TWCoinType.TWCoinTypeBitcoin);
      final url = '${_apiUrl}address$addressBtc';

      final response = await _http.get(
        Uri.parse(url),
      );

      final result = BitcoinAddressInfo.fromJson(jsonDecode(response.body));

      final balance = result.balance;
      if (balance == null) {
        return 0.0;
      }

      final String balanceString = Utils.satoshiToBtc(balance);

      return double.tryParse(balanceString) ?? 0.0;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<String> sendTransaction({
    required String toAddress,
    required String amount,
  }) async {
    final amountBtc = Utils.btcToSatoshi(amount);

    TWCoinType coin = TWCoinType.TWCoinTypeBitcoin;

    final addressBtc = getAddressForCoin(TWCoinType.TWCoinTypeBitcoin);
    final changeAddress = addressBtc;
    final secretPrivateKeyBtc = getKeyForCoin(TWCoinType.TWCoinTypeBitcoin).toList();

    List<Utxo> selectedUtxos = await _loadUtxos(addressBtc, amountBtc);

    final bitcoinScript = BitcoinScript.lockScriptForAddress(addressBtc, coin);

    final Iterable<bitcoin.UnspentTransaction> unspentTransactions = selectedUtxos.map((utxo) {
      return bitcoin.UnspentTransaction(
        amount: $fixnum.Int64.parseInt(utxo.value),
        outPoint: bitcoin.OutPoint(
          hash: hex.decode(utxo.txid).reversed.toList(),
          index: utxo.vout,
          sequence: 0xffffffff,
        ),
        script: bitcoinScript.data,
      );
    }).toList();

    final signingInput = bitcoin.SigningInput(
      amount: $fixnum.Int64.parseInt(amountBtc),
      hashType: BitcoinScript.hashTypeForCoin(coin),
      toAddress: toAddress,
      changeAddress: changeAddress,
      byteFee: $fixnum.Int64(10),
      coinType: coin.value,
      utxo: unspentTransactions,
      privateKey: [
        secretPrivateKeyBtc,
      ],
    );

    bitcoinScript.dispose();

    final transactionPlan = bitcoin.TransactionPlan.fromBuffer(
      AnySigner.signerPlan(signingInput.writeToBuffer(), coin).toList(),
    );
    signingInput.plan = transactionPlan;
    signingInput.amount = transactionPlan.amount;
    final signResult = AnySigner.sign(signingInput.writeToBuffer(), coin);
    final signingOutput = bitcoin.SigningOutput.fromBuffer(signResult);
    final rawTx = Utils.bytesToHex(signingOutput.encoded);

    return _sendRawTransaction(rawTx);
  }

  Future<List<Utxo>> _loadUtxos(String addressBtc, String amount) async {
    String url = '${_apiUrl}utxo/$addressBtc';

    final responseUtxos = await _http.get(
      Uri.parse(url),
      params: {
        'confirmed': 'true',
      },
    );

    List<Utxo> selectedUtxos = [];

    if (responseUtxos.statusCode == 200) {
      final data = jsonDecode(responseUtxos.body) as List;
      final List<Utxo> utxos = data.map((e) => Utxo.fromJson(e)).toList();

      // Примерная стоимость одного байта в сатоши
      const int byteFee = 10; // Может варьироваться в зависимости от нагрузки на сеть

      // Расчет примерного размера транзакции
      int estimatedTxSize = (selectedUtxos.length * 148) + (2 * 34) + 10; // 2 - это 1 выход на получателя и 1 на сдачу

      // Инициализация estimatedFee
      int estimatedFee = estimatedTxSize * byteFee;

      int totalAmount = 0;

      for (final Utxo utxo in utxos) {
        if (totalAmount >= (int.parse(amount) + estimatedFee)) {
          break;
        }
        selectedUtxos.add(utxo);
        totalAmount += int.parse(utxo.value);
      }
    } else {
      throw Exception('Failed to load utxos ${responseUtxos.reasonPhrase}');
    }

    return selectedUtxos;
  }

  Future<String> _sendRawTransaction(String rawTx) async {
    String url = '${_apiUrl}sendtx/$rawTx';

    final response = await _http.get(
      Uri.parse(url),
    );

    return Result.fromJson(jsonDecode(response.body)).result;
  }
}
