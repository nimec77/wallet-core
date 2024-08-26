import 'dart:ffi';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/extensions/extensions.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

final class DataImpl implements Disposable {
  final TrustWalletCore _core;

  /// It must be deleted at the end.
  final Pointer<TWData> _data;

  Pointer<TWData> get data => _data;

  DataImpl.createWithBytes(
    TrustWalletCore core,
    Uint8List bytes,
  )   : _core = core,
        _data = core.TWDataCreateWithBytes(
          bytes.toPointerUint8(),
          bytes.length,
        );

  //TODO: под вопросом
  int size(Pointer<TWData> value) => _core.TWDataSize(value);

  //TODO: под вопросом
  String toDartString(Pointer<TWData> value) => _core.TWStringUTF8Bytes(value).cast<Utf8>().toDartString();

  //TODO: под вопросом
  Uint8List get bytes {
    final size = _core.TWDataSize(_data);
    final data = _core.TWDataBytes(_data);
    return data.asTypedList(size);
  }

  @override
  bool operator ==(Object other) => switch (other) {
        DataImpl v => _core.TWDataEqual(_data, v._data),
        _ => false,
      };

  @override
  int get hashCode => _data.hashCode;

  @override
  void dispose() => _core.TWDataDelete(_data);
}
