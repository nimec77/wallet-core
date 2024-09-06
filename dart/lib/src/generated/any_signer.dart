part of 'package:trust_wallet_core/trust_wallet_core.dart';

typedef SigningInput = GeneratedMessage;

abstract class AnySigner {
  static Uint8List sign(
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final data = DataImpl.createWithBytes(bytes);
    final signer = _bindings.TWAnySignerSign(data.pointer, coin);
    data.dispose();

    return _toUint8List(signer);
  }

  static String signJSON(
    String json,
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final string = StringImpl.createWithString(json);
    final data = DataImpl.createWithBytes(bytes);
    final signer = _bindings.TWAnySignerSignJSON(string.pointer, data.pointer, coin);
    data.dispose();
    string.dispose();

    return StringImpl.toDartString(signer);
  }

  static bool supportsJSON(TWCoinType coin) => _bindings.TWAnySignerSupportsJSON(coin);

  static Uint8List signerPlan(
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final data = DataImpl.createWithBytes(bytes);
    final signer = _bindings.TWAnySignerPlan(data.pointer, coin);
    data.dispose();

    return _toUint8List(signer);
  }

  static Uint8List _toUint8List(Pointer<TWData> data) {
    final signerBytes = _bindings.TWDataBytes(data);
    final size = _bindings.TWDataSize(data);

    return signerBytes.asTypedList(size);
  }
}
