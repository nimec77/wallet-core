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
import 'package:trust_wallet_core/src/common/string_impl.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

class BitcoinScript implements Disposable {
  final TrustWalletCore _core;

  /// It must be deleted at the end.
  final Pointer<TWBitcoinScript> _pointer;

  Pointer<TWBitcoinScript> get pointer => _pointer;

  const BitcoinScript(
    TrustWalletCore core,
    Pointer<TWBitcoinScript> pointer,
  )   : _core = core,
        _pointer = pointer;

  factory BitcoinScript.create(TrustWalletCore core) {
    final pointer = core.TWBitcoinScriptCreate();
    return BitcoinScript(core, pointer);
  }

  factory BitcoinScript.createWithData(
    TrustWalletCore core,
    Uint8List bytes,
  ) {
    final data = DataImpl.createWithBytes(core, bytes);
    final pointer = core.TWBitcoinScriptCreateWithData(data.pointer);
    data.dispose();
    return BitcoinScript(core, pointer);
  }

  factory BitcoinScript.createCopy(
    TrustWalletCore core,
    BitcoinScript script,
  ) {
    final pointer = core.TWBitcoinScriptCreateCopy(script._pointer);
    return BitcoinScript(core, pointer);
  }

  static BitcoinScript buildPayToPublicKey(
    TrustWalletCore core,
    Uint8List pubkey,
  ) {
    final data = DataImpl.createWithBytes(core, pubkey);
    final script = core.TWBitcoinScriptBuildPayToPublicKey(data.pointer);
    data.dispose();
    return BitcoinScript(core, script);
  }

  static BitcoinScript buildPayToPublicKeyHash(
    TrustWalletCore core,
    Uint8List hash,
  ) {
    final data = DataImpl.createWithBytes(core, hash);
    final script = core.TWBitcoinScriptBuildPayToPublicKeyHash(data.pointer);
    data.dispose();
    return BitcoinScript(core, script);
  }

  static BitcoinScript buildPayToScriptHash(
    TrustWalletCore core,
    Uint8List scriptHash,
  ) {
    final data = DataImpl.createWithBytes(core, scriptHash);
    final script = core.TWBitcoinScriptBuildPayToScriptHash(data.pointer);
    data.dispose();
    return BitcoinScript(core, script);
  }

  static BitcoinScript buildPayToWitnessPubkeyHash(
    TrustWalletCore core,
    Uint8List hash,
  ) {
    final data = DataImpl.createWithBytes(core, hash);
    final script = core.TWBitcoinScriptBuildPayToWitnessPubkeyHash(data.pointer);
    data.dispose();
    return BitcoinScript(core, script);
  }

  static BitcoinScript buildPayToWitnessScriptHash(
    TrustWalletCore core,
    Uint8List scriptHash,
  ) {
    final data = DataImpl.createWithBytes(core, scriptHash);
    final script = core.TWBitcoinScriptBuildPayToWitnessScriptHash(data.pointer);
    data.dispose();
    return BitcoinScript(core, script);
  }

  static BitcoinScript lockScriptForAddress(
    TrustWalletCore core,
    String address,
    TWCoinType coin,
  ) {
    final data = StringImpl.createWithString(core, address);
    final script = core.TWBitcoinScriptLockScriptForAddress(data.pointer, coin);
    data.dispose();
    return BitcoinScript(core, script);
  }

  @override
  bool operator ==(Object other) => switch (other) {
        BitcoinScript v => _core.TWBitcoinScriptEqual(_pointer, v._pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  @override
  dispose() => _core.TWBitcoinScriptDelete(_pointer);

  Uint8List? matchPayToPubkey() {
    final pointer = _core.TWBitcoinScriptMatchPayToPubkey(_pointer);
    if (pointer == nullptr) return null;
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List? matchPayToPubkeyHash() {
    final pointer = _core.TWBitcoinScriptMatchPayToPubkeyHash(_pointer);
    if (pointer == nullptr) return null;
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List? matchPayToScriptHash() {
    final pointer = _core.TWBitcoinScriptMatchPayToScriptHash(_pointer);
    if (pointer == nullptr) return null;
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List? matchPayToWitnessPublicKeyHash() {
    final pointer = _core.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(_pointer);
    if (pointer == nullptr) return null;
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List? matchPayToWitnessScriptHash() {
    final pointer = _core.TWBitcoinScriptMatchPayToWitnessScriptHash(_pointer);
    if (pointer == nullptr) return null;
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List encode() {
    final pointer = _core.TWBitcoinScriptEncode(_pointer);
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  int hashTypeForCoin(TWCoinType coinType) => _core.TWBitcoinScriptHashTypeForCoin(coinType);

  int get size => _core.TWBitcoinScriptSize(_pointer);

  Uint8List get data {
    final pointer = _core.TWBitcoinScriptData(_pointer);
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  Uint8List get scriptHash {
    final pointer = _core.TWBitcoinScriptScriptHash(_pointer);
    final data = DataImpl.createWithData(_core, pointer);
    final bytes = data.bytes;
    data.dispose();
    return bytes;
  }

  bool get isPayToScriptHash => _core.TWBitcoinScriptIsPayToScriptHash(_pointer);

  bool get isPayToWitnessScriptHash => _core.TWBitcoinScriptIsPayToWitnessScriptHash(_pointer);

  bool get isPayToWitnessPublicKeyHash => _core.TWBitcoinScriptIsPayToWitnessPublicKeyHash(_pointer);

  bool get isWitnessProgram => _core.TWBitcoinScriptIsWitnessProgram(_pointer);
}
