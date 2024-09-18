part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class DataImpl implements Disposable {
  /// It must be deleted at the end.
  final Pointer<TWData> _pointer;

  Pointer<TWData> get pointer => _pointer;

  const DataImpl.createWithPointer(Pointer<TWData> data) : _pointer = data;

  DataImpl.createWithBytes(Uint8List bytes)
      : _pointer = _bindings.TWDataCreateWithBytes(
          bytes.toPointerUint8(),
          bytes.length,
        );

  DataImpl.createWithData(Pointer<TWData> data) : _pointer = _bindings.TWDataCreateWithData(data);

  int get size => _bindings.TWDataSize(_pointer);

  Uint8List get bytes {
    final size = _bindings.TWDataSize(_pointer);
    final data = _bindings.TWDataBytes(_pointer);
    final typedList = data.asTypedList(size);

    return Uint8List.fromList(typedList.toList());
  }

  @override
  bool operator ==(Object other) => switch (other) {
        DataImpl v => _bindings.TWDataEqual(_pointer, v._pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  @override
  void dispose() => _bindings.TWDataDelete(_pointer);
}
