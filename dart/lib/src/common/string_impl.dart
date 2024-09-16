part of 'package:trust_wallet_core/trust_wallet_core.dart';

class StringImpl implements Disposable {
  /// It must be deleted at the end.
  final Pointer<TWString> _pointer;

  Pointer<TWString> get pointer => _pointer;

  const StringImpl.createWithPointer(Pointer<TWString> pointer) : _pointer = pointer;

  StringImpl.createWithString(String value)
      : _pointer = _bindings.TWStringCreateWithUTF8Bytes(
          value.toNativeUtf8().cast<Char>(),
        );

  static String toDartString(Pointer<TWString> pointer) =>
      _bindings.TWStringUTF8Bytes(pointer).cast<Utf8>().toDartString();

  int get size => _bindings.TWStringSize(_pointer);

  String get dartString => _bindings.TWStringUTF8Bytes(_pointer).cast<Utf8>().toDartString();

  @override
  bool operator ==(Object other) => switch (other) {
        StringImpl v => _bindings.TWStringEqual(_pointer, v._pointer),
        _ => false,
      };

  @override
  int get hashCode => _pointer.hashCode;

  @override
  void dispose() => _bindings.TWStringDelete(_pointer);
}
