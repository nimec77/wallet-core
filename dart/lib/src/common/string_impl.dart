import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/bindings/generated_bindings.dart';

class StringImpl implements Disposable {
  final TrustWalletCoreBindings _core;

  /// It must be deleted at the end.
  final Pointer<TWString> _pointer;

  Pointer<TWString> get pointer => _pointer;

  StringImpl.createWithPointer(
    TrustWalletCoreBindings core,
    Pointer<TWString> pointer,
  )   : _core = core,
        _pointer = pointer;

  StringImpl.createWithString(
    TrustWalletCoreBindings core,
    String value,
  )   : _core = core,
        _pointer = core.TWStringCreateWithUTF8Bytes(
          value.toNativeUtf8().cast<Char>(),
        );

  static String toDartString(
    TrustWalletCoreBindings core,
    Pointer<TWString> pointer,
  ) =>
      core.TWStringUTF8Bytes(pointer).cast<Utf8>().toDartString();

  int get size => _core.TWStringSize(_pointer);

  String get dartString => _core.TWStringUTF8Bytes(_pointer).cast<Utf8>().toDartString();

  @override
  bool operator ==(Object other) => switch (other) {
        StringImpl v => _core.TWStringEqual(_pointer, v._pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  @override
  void dispose() => _core.TWStringDelete(_pointer);
}
