import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

class TWStringImpl {
  final TrustWalletCore _core;

  TWStringImpl(this._core);

  /// It must be deleted at the end.
  Pointer<TWString> toTWString(String value) => _core.TWStringCreateWithUTF8Bytes(value.toNativeUtf8().cast());

  int size(Pointer<TWString> string) => _core.TWStringSize(string);

  String toDartString(Pointer<TWString> value) => _core.TWStringUTF8Bytes(value).cast<Utf8>().toDartString();

  void delete(Pointer<TWString> string) => _core.TWStringDelete(string);

  bool twStringEqual(Pointer<TWString> lhs, Pointer<TWString> rhs) => _core.TWStringEqual(lhs, rhs);
}
