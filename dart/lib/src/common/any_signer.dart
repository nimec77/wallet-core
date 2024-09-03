import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:trust_wallet_core/src/common/data_impl.dart';
import 'package:trust_wallet_core/src/common/string_impl.dart';
import 'package:trust_wallet_core/src/bindings/generated_bindings.dart';

typedef SigningInput = GeneratedMessage;

abstract class AnySigner {
  // /// Signs a transaction by [SigningInput] message and coin type
  // ///
  // /// - Parameters:
  // /// - core: The [TrustWalletCore] instance
  // /// - input: The generic [SigningInput] Protobuf message
  // /// - coin: [TWCoinType]
  // /// - Returns: The generic SigningOutput Protobuf message
  // static T sign<T extends GeneratedMessage>(TrustWalletCore core, SigningInput input, TWCoinType coin) {
  //   // TODO: Think about how to handle the error
  //   final outputData = nativeSign(core, input.writeToBuffer(), coin);
  //   input.mergeFromBuffer(outputData);

  //   return input as T;
  // }

  // /// Signs a transaction by serialized data of a SigningInput and coin type
  // ///
  // /// - Parameters:
  // /// - core: The [TrustWalletCore] instance
  // /// - data: The serialized data of a [SigningInput]
  // /// - coin: [TWCoinType]
  // /// - Returns: The serialized data of a SigningOutput
  // static Uint8List nativeSign(TrustWalletCore core, Uint8List data, TWCoinType coint) {
  //   final inputData = DataImpl.createWithBytes(core, data);

  //   final result = core.TWAnySignerSign(inputData.pointer, coint);
  //   inputData.dispose();
  //   final wrapper = DataImpl.createWithData(core, result);
  //   final bytes = wrapper.bytes;
  //   wrapper.dispose();

  //   return bytes;
  // }

  // /// Check if AnySigner supports signing JSON representation of SigningInput for a given coin.
  // static bool supportsJSON(TrustWalletCore core, TWCoinType coin) {
  //   return core.TWAnySignerSupportsJSON(coin);
  // }

  // /// Signs a transaction specified by the JSON representation of a SigningInput, coin type and a private key
  // ///
  // /// - Parameters:
  // /// - core: The [TrustWalletCore] instance
  // /// - json: JSON representation of a [SigningInput]
  // /// - key: The private key data
  // /// - coin: [TWCoinType]
  // /// - Returns: The JSON representation of a SigningOutput.
  // static String signJSON(TrustWalletCore core, String json, Uint8List key, TWCoinType coin) {
  //   final jsonString = StringImpl.createWithString(core, json);
  //   final keyUint8List = DataImpl.createWithBytes(core, key);

  //   final result = core.TWAnySignerSignJSON(jsonString.pointer, keyUint8List.pointer, coin);
  //   jsonString.dispose();
  //   keyUint8List.dispose();
  //   final wrapper = StringImpl.createWithPointer(core, result);
  //   final string = wrapper.dartString;
  //   wrapper.dispose();

  //   return string;
  // }

  // /// Plans a transaction (for UTXO chains only).
  // ///
  // /// - Parameters:
  // /// - core: The [TrustWalletCore] instance
  // /// - input: The generic [SigningInput] Protobuf message
  // /// - coin: [TWCoinType]
  // /// - Returns: TransactionPlan Protobuf message
  // static T plan<T extends GeneratedMessage>(TrustWalletCore core, SigningInput input, TWCoinType coin) {
  //   // TODO: Think about how to handle the error
  //   final outputData = nativePlan(core, input.writeToBuffer(), coin);
  //   input.mergeFromBuffer(outputData);

  //   return input as T;
  // }

  //   /// Plans a transaction (for UTXO chains only).
  //   ///
  //   /// - Parameters:
  //   /// - core: The [TrustWalletCore] instance
  //   /// - input: The serialized data of a SigningInput
  //   /// - coin: [TWCoinType]
  //   /// - Returns: The serialized data of a TransactionPlan
  // static Uint8List nativePlan(TrustWalletCore core, Uint8List data, TWCoinType coin) {
  //   final inputData = DataImpl.createWithBytes(core, data);

  //   final result = core.TWAnySignerPlan(inputData.pointer, coin);
  //   inputData.dispose();
  //   final wrapper = DataImpl.createWithData(core, result);
  //   final bytes = wrapper.bytes;
  //   wrapper.dispose();

  //   return bytes;
  // }
}
