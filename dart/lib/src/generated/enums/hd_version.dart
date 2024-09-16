// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum HDVersion {
  none(0),
  xpub(0x0488b21e),
  xprv(0x0488ade4),
  ypub(0x049d7cb2),
  yprv(0x049d7878),
  zpub(0x04b24746),
  zprv(0x04b2430c),
  ltub(0x019da462),
  ltpv(0x019d9cfe),
  mtub(0x01b26ef6),
  mtpv(0x01b26792),
  dpub(0x2fda926),
  dprv(0x2fda4e8),
  dgub(0x02facafd),
  dgpv(0x02fac398);

  final int value;

  const HDVersion(this.value);

  static HDVersion fromValue(int value) => switch (value) {
    0 => none,
    0x0488b21e => xpub,
    0x0488ade4 => xprv,
    0x049d7cb2 => ypub,
    0x049d7878 => yprv,
    0x04b24746 => zpub,
    0x04b2430c => zprv,
    0x019da462 => ltub,
    0x019d9cfe => ltpv,
    0x01b26ef6 => mtub,
    0x01b26792 => mtpv,
    0x2fda926 => dpub,
    0x2fda4e8 => dprv,
    0x02facafd => dgub,
    0x02fac398 => dgpv,
    _ => throw ArgumentError("Unknown value for HDVersion: $value"),
  };

  
  bool get isPublic {
    final obj = TWHDVersion.fromValue(value);
    final result = _bindings.TWHDVersionIsPublic(obj);

    return result;
  }
  
  
  bool get isPrivate {
    final obj = TWHDVersion.fromValue(value);
    final result = _bindings.TWHDVersionIsPrivate(obj);

    return result;
  }
  }
