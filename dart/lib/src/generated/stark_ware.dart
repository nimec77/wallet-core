// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

final class StarkWare {
  static PrivateKey getStarkKeyFromSignature({
    required DerivationPath derivationPath,
    required String signature,
  }) {
    final derivationPathDerivationPath = derivationPath.pointer;
    final signatureString = StringImpl.createWithString(signature);
    final result = _bindings.TWStarkWareGetStarkKeyFromSignature(
        derivationPathDerivationPath, signatureString.pointer);
    signatureString.dispose();

    return PrivateKey._(result);
  }
}
