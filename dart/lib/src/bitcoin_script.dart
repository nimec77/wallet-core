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
  late final Pointer<TWBitcoinScript> _pointer;

  BitcoinScript.create(TrustWalletCore core)
      : _core = core,
        _pointer = core.TWBitcoinScriptCreate();

  BitcoinScript.createWithData(
    TrustWalletCore core,
    Uint8List bytes,
  ) : _core = core {
    final data = DataImpl.createWithBytes(core, bytes);
    _pointer = _core.TWBitcoinScriptCreateWithData(data.pointer);
    data.dispose();
  }

  BitcoinScript.createCopy(
    TrustWalletCore core,
    BitcoinScript script,
  )   : _core = core,
        _pointer = core.TWBitcoinScriptCreateCopy(script._pointer);

  BitcoinScript.buildPayToPublicKey(
    TrustWalletCore core,
    Uint8List pubkey,
  ) : _core = core {
    final data = DataImpl.createWithBytes(_core, pubkey);
    _pointer = _core.TWBitcoinScriptBuildPayToPublicKey(data.pointer);
    data.dispose();
  }

  BitcoinScript.buildPayToPublicKeyHash(
    TrustWalletCore core,
    Uint8List hash,
  ) : _core = core {
    final data = DataImpl.createWithBytes(_core, hash);
    _pointer = _core.TWBitcoinScriptBuildPayToPublicKeyHash(data.pointer);
    data.dispose();
  }

  BitcoinScript.buildPayToScriptHash(
    TrustWalletCore core,
    Uint8List scriptHash,
  ) : _core = core {
    final data = DataImpl.createWithBytes(_core, scriptHash);
    _pointer = _core.TWBitcoinScriptBuildPayToScriptHash(data.pointer);
    data.dispose();
  }

  BitcoinScript.buildPayToWitnessPubkeyHash(
    TrustWalletCore core,
    Uint8List hash,
  ) : _core = core {
    final data = DataImpl.createWithBytes(_core, hash);
    _pointer = _core.TWBitcoinScriptBuildPayToWitnessPubkeyHash(data.pointer);
    data.dispose();
  }

  BitcoinScript.buildPayToWitnessScriptHash(
    TrustWalletCore core,
    Uint8List scriptHash,
  ) : _core = core {
    final data = DataImpl.createWithBytes(_core, scriptHash);
    _pointer = _core.TWBitcoinScriptBuildPayToWitnessScriptHash(data.pointer);
    data.dispose();
  }

  BitcoinScript.lockScriptForAddress(
    TrustWalletCore core,
    String address,
    TWCoinType coin,
  ) : _core = core {
    final data = StringImpl.createWithUTF8Bytes(_core, address);
    _pointer = _core.TWBitcoinScriptLockScriptForAddress(data.pointer, coin);
    data.dispose();
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
