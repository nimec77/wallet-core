import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

final class StringImpl implements Disposable {
  final TrustWalletCore _core;

  /// It must be deleted at the end.
  final Pointer<TWString> _data;

  Pointer<TWString> get data => _data;

  StringImpl.createWithUTF8Bytes(
    TrustWalletCore core,
    String value,
  )   : _core = core,
        _data = core.TWStringCreateWithUTF8Bytes(
          value.toNativeUtf8().cast<Char>(),
        );

  int size(Pointer<TWString> value) => _core.TWStringSize(value);

  String toDartString(Pointer<TWString> value) => _core.TWStringUTF8Bytes(value).cast<Utf8>().toDartString();

  @override
  bool operator ==(Object other) => switch (other) {
        StringImpl v => _core.TWStringEqual(_data, v._data),
        _ => false,
      };

  @override
  int get hashCode => _data.hashCode;

  @override
  void dispose() => _core.TWStringDelete(_data);
}
