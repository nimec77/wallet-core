import 'dart:ffi';
import 'dart:typed_data';

import 'package:trust_wallet_core/src/common/abstractions.dart';
import 'package:trust_wallet_core/src/extensions/extensions.dart';
import 'package:trust_wallet_core/src/gen/ffi/generated_bindings.dart';

final class DataImpl implements Disposable {
  final TrustWalletCoreBindings _core;

  /// It must be deleted at the end.
  final Pointer<TWData> _pointer;

  Pointer<TWData> get pointer => _pointer;

  DataImpl.createWithBytes(
    TrustWalletCoreBindings core,
    Uint8List bytes,
  )   : _core = core,
        _pointer = core.TWDataCreateWithBytes(
          bytes.toPointerUint8(),
          bytes.length,
        );

  DataImpl.createWithData(
    TrustWalletCoreBindings core,
    Pointer<TWData> data,
  )   : _core = core,
        _pointer = core.TWDataCreateWithData(
          data,
        );

  int get size => _core.TWDataSize(_pointer);

  Uint8List get bytes {
    final size = _core.TWDataSize(_pointer);
    final data = _core.TWDataBytes(_pointer);
    return data.asTypedList(size);
  }

  @override
  bool operator ==(Object other) => switch (other) {
        DataImpl v => _core.TWDataEqual(_pointer, v._pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  @override
  void dispose() => _core.TWDataDelete(_pointer);
}
