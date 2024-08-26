import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

extension TWStringExtension on TrustWalletCore {
  /// It must be deleted at the end.
  Pointer<TWString> toTWString(String value) => TWStringCreateWithUTF8Bytes(value.toNativeUtf8().cast());

  int size(Pointer<TWString> string) => TWStringSize(string);

  String toDartString(Pointer<TWString> value) => TWStringUTF8Bytes(value).cast<Utf8>().toDartString();

  void delete(Pointer<TWString> string) => TWStringDelete(string);

  bool twStringEqual(Pointer<TWString> lhs, Pointer<TWString> rhs) => TWStringEqual(lhs, rhs);
}
