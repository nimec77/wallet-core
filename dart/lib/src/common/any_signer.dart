import 'dart:ffi';
import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';

typedef SigningInput = GeneratedMessage;

abstract class AnySigner {
  static Uint8List sign(
    TrustWalletCoreBindings core,
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final data = DataImpl.createWithBytes(core, bytes);
    final signer = core.TWAnySignerSign(data.pointer, coin);
    data.dispose();

    return _toUint8List(core, signer);
  }

  static String signJSON(
    TrustWalletCoreBindings core,
    String json,
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final string = StringImpl.createWithString(core, json);
    final data = DataImpl.createWithBytes(core, bytes);
    final signer = core.TWAnySignerSignJSON(string.pointer, data.pointer, coin);
    data.dispose();
    string.dispose();

    return StringImpl.toDartString(core, signer);
  }

  static bool supportsJSON(TrustWalletCoreBindings core, TWCoinType coin) => core.TWAnySignerSupportsJSON(coin);

  static Uint8List signerPlan(
    TrustWalletCoreBindings core,
    Uint8List bytes,
    TWCoinType coin,
  ) {
    final data = DataImpl.createWithBytes(core, bytes);
    final signer = core.TWAnySignerPlan(data.pointer, coin);
    data.dispose();

    return _toUint8List(core, signer);
  }

  static Uint8List _toUint8List(
    TrustWalletCoreBindings core,
    Pointer<TWData> data,
  ) {
    final signerBytes = core.TWDataBytes(data);
    final size = core.TWDataSize(data);

    return signerBytes.asTypedList(size);
  }
}
