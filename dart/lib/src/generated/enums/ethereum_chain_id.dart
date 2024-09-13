// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum EthereumChainID {
    ethereum(1),
    classic(61),
    poa(99),
    vechain(74),
    callisto(820),
    tomochain(88),
    polygon(137),
    okc(66),
    thundertoken(108),
    gochain(60),
    meter(82),
    celo(42220),
    wanchain(888),
    cronos(25),
    optimism(10),
    xdai(100),
    smartbch(10000),
    fantom(250),
    boba(288),
    kcc(321),
    zksync(324),
    heco(128),
    metis(1088),
    polygonzkevm(1101),
    moonbeam(1284),
    moonriver(1285),
    ronin(2020),
    kavaevm(2222),
    iotexevm(4689),
    kaia(8217),
    avalanchec(43114),
    evmos(9001),
    arbitrum(42161),
    smartchain(56),
    aurora(1313161554);

    final int value;

    const EthereumChainID(this.value);

    static EthereumChainID fromValue(int value) => switch (value) {
        1 => ethereum,
        61 => classic,
        99 => poa,
        74 => vechain,
        820 => callisto,
        88 => tomochain,
        137 => polygon,
        66 => okc,
        108 => thundertoken,
        60 => gochain,
        82 => meter,
        42220 => celo,
        888 => wanchain,
        25 => cronos,
        10 => optimism,
        100 => xdai,
        10000 => smartbch,
        250 => fantom,
        288 => boba,
        321 => kcc,
        324 => zksync,
        128 => heco,
        1088 => metis,
        1101 => polygonzkevm,
        1284 => moonbeam,
        1285 => moonriver,
        2020 => ronin,
        2222 => kavaevm,
        4689 => iotexevm,
        8217 => kaia,
        43114 => avalanchec,
        9001 => evmos,
        42161 => arbitrum,
        56 => smartchain,
        1313161554 => aurora,
        _ => throw ArgumentError("Unknown value for EthereumChainID: $value"),
    };
}
