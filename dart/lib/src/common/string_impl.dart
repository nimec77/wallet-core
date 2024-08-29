import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

final class StringImpl implements Disposable {
  final TrustWalletCore _core;

  /// It must be deleted at the end.
  final Pointer<TWString> _pointer;

  Pointer<TWString> get pointer => _pointer;

  StringImpl.createWithUTF8Bytes(
    TrustWalletCore core,
    String value,
  )   : _core = core,
        _pointer = core.TWStringCreateWithUTF8Bytes(
          value.toNativeUtf8().cast<Char>(),
        );

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
