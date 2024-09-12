// // SPDX-License-Identifier: Apache-2.0
// //
// // Copyright © 2017 Trust Wallet.
// //
// // This is a GENERATED FILE, changes made here WILL BE LOST.
// //

// part of 'package:trust_wallet_core/trust_wallet_core.dart';

// class BitcoinScript implements Disposable {
//   /// It must be deleted at the end.
//   final Pointer<TWBitcoinScript> _pointer;

//   Pointer<TWBitcoinScript> get pointer => _pointer;

//   const BitcoinScript._(Pointer<TWBitcoinScript> pointer) : _pointer = pointer;

//   factory BitcoinScript.create() {
//     final pointer = _bindings.TWBitcoinScriptCreate();
//     return BitcoinScript._(pointer);
//   }

//   factory BitcoinScript.createWithData(Uint8List bytes) {
//     final data = DataImpl.createWithBytes(bytes);
//     final pointer = _bindings.TWBitcoinScriptCreateWithData(data.pointer);
//     data.dispose();
//     return BitcoinScript._(pointer);
//   }

//   factory BitcoinScript.createCopy(BitcoinScript script) {
//     final pointer = _bindings.TWBitcoinScriptCreateCopy(script._pointer);
//     return BitcoinScript._(pointer);
//   }

//   static BitcoinScript buildPayToPublicKey(Uint8List pubkey) {
//     final data = DataImpl.createWithBytes(pubkey);
//     final script = _bindings.TWBitcoinScriptBuildPayToPublicKey(data.pointer);
//     data.dispose();
//     return BitcoinScript._(script);
//   }

//   static BitcoinScript buildPayToPublicKeyHash(Uint8List hash) {
//     final data = DataImpl.createWithBytes(hash);
//     final script = _bindings.TWBitcoinScriptBuildPayToPublicKeyHash(data.pointer);
//     data.dispose();
//     return BitcoinScript._(script);
//   }

//   static BitcoinScript buildPayToScriptHash(Uint8List scriptHash) {
//     final data = DataImpl.createWithBytes(scriptHash);
//     final script = _bindings.TWBitcoinScriptBuildPayToScriptHash(data.pointer);
//     data.dispose();
//     return BitcoinScript._(script);
//   }

//   static BitcoinScript buildPayToWitnessPubkeyHash(Uint8List hash) {
//     final data = DataImpl.createWithBytes(hash);
//     final script = _bindings.TWBitcoinScriptBuildPayToWitnessPubkeyHash(data.pointer);
//     data.dispose();
//     return BitcoinScript._(script);
//   }

//   static BitcoinScript buildPayToWitnessScriptHash(Uint8List scriptHash) {
//     final data = DataImpl.createWithBytes(scriptHash);
//     final script = _bindings.TWBitcoinScriptBuildPayToWitnessScriptHash(data.pointer);
//     data.dispose();
//     return BitcoinScript._(script);
//   }

//   static BitcoinScript lockScriptForAddress(String address, TWCoinType coin) {
//     final dataString = StringImpl.createWithString(address);
//     final script = _bindings.TWBitcoinScriptLockScriptForAddress(dataString.pointer, coin);
//     dataString.dispose();
//     return BitcoinScript._(script);
//   }

//   @override
//   bool operator ==(Object other) => switch (other) {
//         BitcoinScript v => _bindings.TWBitcoinScriptEqual(_pointer, v._pointer),
//         _ => false,
//       };

//   @override
//   int get hashCode => _pointer.hashCode;

//   @override
//   dispose() => _bindings.TWBitcoinScriptDelete(_pointer);

//   static int hashTypeForCoin(TWCoinType coinType) => _bindings.TWBitcoinScriptHashTypeForCoin(coinType);

//   Uint8List? matchPayToPubkey() {
//     final pointer = _bindings.TWBitcoinScriptMatchPayToPubkey(_pointer);
//     if (pointer == nullptr) return null;
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List? matchPayToPubkeyHash() {
//     final pointer = _bindings.TWBitcoinScriptMatchPayToPubkeyHash(_pointer);
//     if (pointer == nullptr) return null;
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List? matchPayToScriptHash() {
//     final pointer = _bindings.TWBitcoinScriptMatchPayToScriptHash(_pointer);
//     if (pointer == nullptr) return null;
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List? matchPayToWitnessPublicKeyHash() {
//     final pointer = _bindings.TWBitcoinScriptMatchPayToWitnessPublicKeyHash(_pointer);
//     if (pointer == nullptr) return null;
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List? matchPayToWitnessScriptHash() {
//     final pointer = _bindings.TWBitcoinScriptMatchPayToWitnessScriptHash(_pointer);
//     if (pointer == nullptr) return null;
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List encode() {
//     final pointer = _bindings.TWBitcoinScriptEncode(_pointer);
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   int get size => _bindings.TWBitcoinScriptSize(_pointer);

//   Uint8List get data {
//     final pointer = _bindings.TWBitcoinScriptData(_pointer);
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   Uint8List get scriptHash {
//     final pointer = _bindings.TWBitcoinScriptScriptHash(_pointer);
//     final data = DataImpl.createWithData(pointer);
//     final bytes = data.bytes;
//     data.dispose();
//     return bytes;
//   }

//   bool get isPayToScriptHash => _bindings.TWBitcoinScriptIsPayToScriptHash(_pointer);

//   bool get isPayToWitnessScriptHash => _bindings.TWBitcoinScriptIsPayToWitnessScriptHash(_pointer);

//   bool get isPayToWitnessPublicKeyHash => _bindings.TWBitcoinScriptIsPayToWitnessPublicKeyHash(_pointer);

//   bool get isWitnessProgram => _bindings.TWBitcoinScriptIsWitnessProgram(_pointer);
// }
