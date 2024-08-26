// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import 'dart:ffi';
import 'dart:typed_data';

import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/common/data_impl.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

class BitcoinScript implements Disposable {
  final TrustWalletCore _core;

  /// It must be deleted at the end.
  late Pointer<TWBitcoinScript> _rawValue;

  Pointer<TWBitcoinScript> get rawValue => _rawValue;

  BitcoinScript.create(TrustWalletCore core)
      : _core = core,
        _rawValue = core.TWBitcoinScriptCreate();

  BitcoinScript.createWithData(
    TrustWalletCore core,
    Uint8List bytes,
  ) : _core = core {
    final data = DataImpl.createWithBytes(core, bytes);
    _rawValue = _core.TWBitcoinScriptCreateWithData(data.data);
    data.dispose();
  }

  BitcoinScript.createCopy(
    TrustWalletCore core,
    BitcoinScript script,
  )   : _core = core,
        _rawValue = core.TWBitcoinScriptCreateCopy(script.rawValue);

  @override
  bool operator ==(Object other) => switch (other) {
        BitcoinScript v => _core.TWBitcoinScriptEqual(_rawValue, v._rawValue),
        _ => false,
      };

  @override
  int get hashCode => _rawValue.hashCode;

  @override
  dispose() => _core.TWBitcoinScriptDelete(rawValue);

  //  Data? matchPayToPubkey() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptMatchPayToPubkey(obj);
  //         if (result == null) {
  //             return null;
  //         }

  //         return TWDataNSData(result);
  // }

  //  Data? matchPayToPubkeyHash() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptMatchPayToPubkeyHash(obj);
  //         if (result == null) {
  //             return null;
  //         }

  //         return TWDataNSData(result);
  // }

  //  Data? matchPayToScriptHash() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptMatchPayToScriptHash(obj);
  //         if (result == null) {
  //             return null;
  //         }

  //         return TWDataNSData(result);
  // }

  //  Data? matchPayToWitnessPublicKeyHash() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(obj);
  //         if (result == null) {
  //             return null;
  //         }

  //         return TWDataNSData(result);
  // }

  //  Data? matchPayToWitnessScriptHash() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptMatchPayToWitnessScriptHash(obj);
  //         if (result == null) {
  //             return null;
  //         }

  //         return TWDataNSData(result);
  // }

  //  Data encode() {

  //         final obj = rawValue;
  //         final result = _core.TWBitcoinScriptEncode(obj);

  //         return TWDataNSData(result);
  // }

  // static BitcoinScript buildPayToPublicKey(Data pubkey) {
  //     try {
  //         final pubkey = _core.TWDataCreateWithNSData(pubkey);
  //         final result = _core.TWBitcoinScriptBuildPayToPublicKey(pubkey);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWDataDelete(pubkey);
  //     }
  // }

  // static BitcoinScript buildPayToPublicKeyHash(Data hash) {
  //     try {
  //         final hash = _core.TWDataCreateWithNSData(hash);
  //         final result = _core.TWBitcoinScriptBuildPayToPublicKeyHash(hash);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWDataDelete(hash);
  //     }
  // }

  // static BitcoinScript buildPayToScriptHash(Data scriptHash) {
  //     try {
  //         final scriptHash = _core.TWDataCreateWithNSData(scriptHash);
  //         final result = _core.TWBitcoinScriptBuildPayToScriptHash(scriptHash);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWDataDelete(scriptHash);
  //     }
  // }

  // static BitcoinScript buildPayToWitnessPubkeyHash(Data hash) {
  //     try {
  //         final hash = _core.TWDataCreateWithNSData(hash);
  //         final result = _core.TWBitcoinScriptBuildPayToWitnessPubkeyHash(hash);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWDataDelete(hash);
  //     }
  // }

  // static BitcoinScript buildPayToWitnessScriptHash(Data scriptHash) {
  //     try {
  //         final scriptHash = _core.TWDataCreateWithNSData(scriptHash);
  //         final result = _core.TWBitcoinScriptBuildPayToWitnessScriptHash(scriptHash);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWDataDelete(scriptHash);
  //     }
  // }

  // static BitcoinScript lockScriptForAddress(String address, CoinType coin) {
  //     try {
  //         final address = _core.TWStringCreateWithNSString(address);
  //         final coin = _core.TWCoinType.fromValue(coin.value);
  //         final result = _core.TWBitcoinScriptLockScriptForAddress(address, coin);

  //         return BitcoinScript(rawValue: result);
  //     } finally {
  //         _core.TWStringDelete(address);
  //     }
  // }

  // static UInt32 hashTypeForCoin(CoinType coinType) {
  //     try {
  //         final coinType = _core.TWCoinType.fromValue(coinType.value);
  //         final result = _core.TWBitcoinScriptHashTypeForCoin(coinType);

  //         return result;
  //     } finally {
  //     }
  // }

  // Int get size {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptSize(obj);

  //     return result;
  // }

  // Data get data {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptData(obj);

  //     return TWDataNSData(result);
  // }

  // Data get scriptHash {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptScriptHash(obj);

  //     return TWDataNSData(result);
  // }

  // Bool get isPayToScriptHash {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptIsPayToScriptHash(obj);

  //     return result;
  // }

  // Bool get isPayToWitnessScriptHash {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptIsPayToWitnessScriptHash(obj);

  //     return result;
  // }

  // Bool get isPayToWitnessPublicKeyHash {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptIsPayToWitnessPublicKeyHash(obj);

  //     return result;
  // }

  // Bool get isWitnessProgram {
  //     final obj = rawValue;
  //     final result = _core.TWBitcoinScriptIsWitnessProgram(obj);

  //     return result;
  // }
}
