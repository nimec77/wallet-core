// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

part of 'package:trust_wallet_core/trust_wallet_core.dart';

enum CoinType {
    aeternity(457),
    aion(425),
    binance(714),
    bitcoin(0),
    bitcoinCash(145),
    bitcoinGold(156),
    callisto(820),
    cardano(1815),
    cosmos(118),
    pivx(119),
    dash(5),
    decred(42),
    digiByte(20),
    dogecoin(3),
    eos(194),
    wax(14001),
    ethereum(60),
    ethereumClassic(61),
    fio(235),
    goChain(6060),
    groestlcoin(17),
    icon(74),
    ioTeX(304),
    kava(459),
    kin(2017),
    litecoin(2),
    monacoin(22),
    nebulas(2718),
    nuls(8964),
    nano(165),
    near(397),
    nimiq(242),
    ontology(1024),
    poaNetwork(178),
    qtum(2301),
    xrp(144),
    solana(501),
    stellar(148),
    tezos(1729),
    theta(500),
    thunderCore(1001),
    neo(888),
    viction(889),
    tron(195),
    veChain(818),
    viacoin(14),
    wanchain(5718350),
    zcash(133),
    firo(136),
    zilliqa(313),
    zelcash(19167),
    ravencoin(175),
    waves(5741564),
    terra(330),
    terraV2(10000330),
    harmony(1023),
    algorand(283),
    kusama(434),
    polkadot(354),
    filecoin(461),
    multiversX(508),
    bandChain(494),
    smartChainLegacy(10000714),
    smartChain(20000714),
    tBinance(30000714),
    oasis(474),
    polygon(966),
    thorChain(931),
    bluzelle(483),
    optimism(10000070),
    zkSync(10000324),
    arbitrum(10042221),
    ecoChain(10000553),
    avalancheCChain(10009000),
    xDai(10000100),
    fantom(10000250),
    cryptoOrg(394),
    celo(52752),
    ronin(10002020),
    osmosis(10000118),
    eCash(899),
    iost(291),
    cronosChain(10000025),
    smartBitcoinCash(10000145),
    kuCoinCommunityChain(10000321),
    bitcoinDiamond(999),
    boba(10000288),
    syscoin(57),
    verge(77),
    zen(121),
    metis(10001088),
    aurora(1323161554),
    evmos(10009001),
    nativeEvmos(20009001),
    moonriver(10001285),
    moonbeam(10001284),
    kavaEvm(10002222),
    klaytn(10008217),
    meter(18000),
    okxChain(996),
    stratis(105105),
    komodo(141),
    nervos(309),
    everscale(396),
    aptos(637),
    nebl(146),
    hedera(3030),
    secret(529),
    nativeInjective(10000060),
    agoric(564),
    ton(607),
    sui(784),
    stargaze(20000118),
    polygonzkEVM(10001101),
    juno(30000118),
    stride(40000118),
    axelar(50000118),
    crescent(60000118),
    kujira(70000118),
    ioTeXEVM(10004689),
    nativeCanto(10007700),
    comdex(80000118),
    neutron(90000118),
    sommelier(11000118),
    fetchAI(12000118),
    mars(13000118),
    umee(14000118),
    coreum(10000990),
    quasar(15000118),
    persistence(16000118),
    akash(17000118),
    noble(18000118),
    scroll(534352),
    rootstock(137),
    thetaFuel(361),
    confluxeSpace(1030),
    acala(787),
    acalaEVM(10000787),
    opBNB(204),
    neon(245022934),
    baseValue(8453),
    sei(19000118),
    arbitrumNova(10042170),
    linea(59144),
    greenfield(5600),
    mantle(5000),
    zenEON(7332),
    internetComputer(223),
    tia(21000118),
    mantaPacific(169),
    nativeZetaChain(10007000),
    zetaEVM(20007000),
    dydx(22000118),
    merlin(4200),
    lightlink(1890),
    blast(81457),
    bounceBit(6001),
    zkLinkNova(810180);

    final int value;

    const CoinType(this.value);

    static CoinType fromValue(int value) => switch (value) {
        457 => aeternity,
        425 => aion,
        714 => binance,
        0 => bitcoin,
        145 => bitcoinCash,
        156 => bitcoinGold,
        820 => callisto,
        1815 => cardano,
        118 => cosmos,
        119 => pivx,
        5 => dash,
        42 => decred,
        20 => digiByte,
        3 => dogecoin,
        194 => eos,
        14001 => wax,
        60 => ethereum,
        61 => ethereumClassic,
        235 => fio,
        6060 => goChain,
        17 => groestlcoin,
        74 => icon,
        304 => ioTeX,
        459 => kava,
        2017 => kin,
        2 => litecoin,
        22 => monacoin,
        2718 => nebulas,
        8964 => nuls,
        165 => nano,
        397 => near,
        242 => nimiq,
        1024 => ontology,
        178 => poaNetwork,
        2301 => qtum,
        144 => xrp,
        501 => solana,
        148 => stellar,
        1729 => tezos,
        500 => theta,
        1001 => thunderCore,
        888 => neo,
        889 => viction,
        195 => tron,
        818 => veChain,
        14 => viacoin,
        5718350 => wanchain,
        133 => zcash,
        136 => firo,
        313 => zilliqa,
        19167 => zelcash,
        175 => ravencoin,
        5741564 => waves,
        330 => terra,
        10000330 => terraV2,
        1023 => harmony,
        283 => algorand,
        434 => kusama,
        354 => polkadot,
        461 => filecoin,
        508 => multiversX,
        494 => bandChain,
        10000714 => smartChainLegacy,
        20000714 => smartChain,
        30000714 => tBinance,
        474 => oasis,
        966 => polygon,
        931 => thorChain,
        483 => bluzelle,
        10000070 => optimism,
        10000324 => zkSync,
        10042221 => arbitrum,
        10000553 => ecoChain,
        10009000 => avalancheCChain,
        10000100 => xDai,
        10000250 => fantom,
        394 => cryptoOrg,
        52752 => celo,
        10002020 => ronin,
        10000118 => osmosis,
        899 => eCash,
        291 => iost,
        10000025 => cronosChain,
        10000145 => smartBitcoinCash,
        10000321 => kuCoinCommunityChain,
        999 => bitcoinDiamond,
        10000288 => boba,
        57 => syscoin,
        77 => verge,
        121 => zen,
        10001088 => metis,
        1323161554 => aurora,
        10009001 => evmos,
        20009001 => nativeEvmos,
        10001285 => moonriver,
        10001284 => moonbeam,
        10002222 => kavaEvm,
        10008217 => klaytn,
        18000 => meter,
        996 => okxChain,
        105105 => stratis,
        141 => komodo,
        309 => nervos,
        396 => everscale,
        637 => aptos,
        146 => nebl,
        3030 => hedera,
        529 => secret,
        10000060 => nativeInjective,
        564 => agoric,
        607 => ton,
        784 => sui,
        20000118 => stargaze,
        10001101 => polygonzkEVM,
        30000118 => juno,
        40000118 => stride,
        50000118 => axelar,
        60000118 => crescent,
        70000118 => kujira,
        10004689 => ioTeXEVM,
        10007700 => nativeCanto,
        80000118 => comdex,
        90000118 => neutron,
        11000118 => sommelier,
        12000118 => fetchAI,
        13000118 => mars,
        14000118 => umee,
        10000990 => coreum,
        15000118 => quasar,
        16000118 => persistence,
        17000118 => akash,
        18000118 => noble,
        534352 => scroll,
        137 => rootstock,
        361 => thetaFuel,
        1030 => confluxeSpace,
        787 => acala,
        10000787 => acalaEVM,
        204 => opBNB,
        245022934 => neon,
        8453 => baseValue,
        19000118 => sei,
        10042170 => arbitrumNova,
        59144 => linea,
        5600 => greenfield,
        5000 => mantle,
        7332 => zenEON,
        223 => internetComputer,
        21000118 => tia,
        169 => mantaPacific,
        10007000 => nativeZetaChain,
        20007000 => zetaEVM,
        22000118 => dydx,
        4200 => merlin,
        1890 => lightlink,
        81457 => blast,
        6001 => bounceBit,
        810180 => zkLinkNova,
        _ => throw ArgumentError("Unknown value for CoinType: $value"),
    };

    String get description => switch (value) {
        457 => 'Aeternity',
        425 => 'Aion',
        714 => 'Binance Coin',
        0 => 'Bitcoin',
        145 => 'Bitcoin Cash',
        156 => 'Bitcoin Gold',
        820 => 'Callisto',
        1815 => 'Cardano',
        118 => 'Cosmos',
        119 => 'PIVX',
        5 => 'Dash',
        42 => 'Decred',
        20 => 'DigiByte',
        3 => 'Dogecoin',
        194 => 'EOS',
        14001 => 'WAX',
        60 => 'Ethereum',
        61 => 'Ethereum Classic',
        235 => 'FIO',
        6060 => 'GoChain',
        17 => 'Groestlcoin',
        74 => 'ICON',
        304 => 'IoTeX',
        459 => 'Kava',
        2017 => 'Kin',
        2 => 'Litecoin',
        22 => 'MonaCoin',
        2718 => 'Nebulas',
        8964 => 'NULS',
        165 => 'Nano',
        397 => 'NEAR Protocol',
        242 => 'Nimiq',
        1024 => 'Ontology',
        178 => 'POA Network',
        2301 => 'Qtum',
        144 => 'XRP',
        501 => 'Solana',
        148 => 'Stellar',
        1729 => 'Tezos',
        500 => 'Theta Network',
        1001 => 'ThunderCore',
        888 => 'Neo',
        889 => 'Viction',
        195 => 'TRON',
        818 => 'VeChain',
        14 => 'Viacoin',
        5718350 => 'Wanchain',
        133 => 'Zcash',
        136 => 'Firo',
        313 => 'Zilliqa',
        19167 => 'Zelcash',
        175 => 'Ravencoin',
        5741564 => 'Waves',
        330 => 'Terra',
        10000330 => 'Terra V2',
        1023 => 'Harmony',
        283 => 'Algorand',
        434 => 'Kusama',
        354 => 'Polkadot',
        461 => 'Filecoin',
        508 => 'MultiversX',
        494 => 'Band Protocol',
        10000714 => 'SmartChain Legacy',
        20000714 => 'SmartChain',
        30000714 => 'Binance Testnet',
        474 => 'Oasis Network',
        966 => 'Polygon',
        931 => 'THORChain',
        483 => 'Bluzelle',
        10000070 => 'Optimism',
        10000324 => 'zkSync',
        10042221 => 'Arbitrum',
        10000553 => 'ECO Chain',
        10009000 => 'Avalanche C-Chain',
        10000100 => 'xDai',
        10000250 => 'Fantom',
        394 => 'Crypto.org Coin',
        52752 => 'Celo',
        10002020 => 'Ronin',
        10000118 => 'Osmosis',
        899 => 'eCash',
        291 => 'IOST',
        10000025 => 'Cronos',
        10000145 => 'Smart Bitcoin Cash',
        10000321 => 'KuCoin Community Chain',
        999 => 'Bitcoin Diamond',
        10000288 => 'Boba Network',
        57 => 'Syscoin',
        77 => 'Verge',
        121 => 'Horizen (Zen)',
        10001088 => 'Metis',
        1323161554 => 'Aurora',
        10009001 => 'Evmos',
        20009001 => 'Native Evmos',
        10001285 => 'Moonriver',
        10001284 => 'Moonbeam',
        10002222 => 'Kava EVM',
        10008217 => 'Klaytn',
        18000 => 'Meter',
        996 => 'OKX Chain',
        105105 => 'Stratis',
        141 => 'Komodo',
        309 => 'Nervos Network',
        396 => 'Everscale',
        637 => 'Aptos',
        146 => 'Neblio',
        3030 => 'Hedera',
        529 => 'Secret Network',
        10000060 => 'Native Injective',
        564 => 'Agoric',
        607 => 'TON (The Open Network)',
        784 => 'Sui',
        20000118 => 'Stargaze',
        10001101 => 'Polygon zkEVM',
        30000118 => 'Juno',
        40000118 => 'Stride',
        50000118 => 'Axelar',
        60000118 => 'Crescent',
        70000118 => 'Kujira',
        10004689 => 'IoTeX EVM',
        10007700 => 'Native Canto',
        80000118 => 'Comdex',
        90000118 => 'Neutron',
        11000118 => 'Sommelier',
        12000118 => 'Fetch.ai',
        13000118 => 'Mars Protocol',
        14000118 => 'Umee',
        10000990 => 'Coreum',
        15000118 => 'Quasar',
        16000118 => 'Persistence',
        17000118 => 'Akash Network',
        18000118 => 'Noble',
        534352 => 'Scroll',
        137 => 'Rootstock (RSK)',
        361 => 'Theta Fuel',
        1030 => 'Conflux eSpace',
        787 => 'Acala',
        10000787 => 'Acala EVM',
        204 => 'opBNB',
        245022934 => 'Neon',
        8453 => 'Base',
        19000118 => 'Sei Network',
        10042170 => 'Arbitrum Nova',
        59144 => 'Linea',
        5600 => 'Greenfield',
        5000 => 'Mantle',
        7332 => 'ZenEON',
        223 => 'Internet Computer',
        21000118 => 'TIA',
        169 => 'Manta Pacific',
        10007000 => 'Native ZetaChain',
        20007000 => 'Zeta EVM',
        22000118 => 'dYdX',
        4200 => 'Merlin',
        1890 => 'Lightlink',
        81457 => 'Blast',
        6001 => 'Bounce Bit',
        810180 => 'zkLink Nova',
        _ => throw ArgumentError("Unknown value for CoinType: $value"),
    };

    String get ticker => switch (value) {
        457 => 'AE',
        425 => 'AION',
        714 => 'BNB',
        0 => 'BTC',
        145 => 'BCH',
        156 => 'BTG',
        820 => 'CLO',
        1815 => 'ADA',
        118 => 'ATOM',
        119 => 'PIVX',
        5 => 'DASH',
        42 => 'DCR',
        20 => 'DGB',
        3 => 'DOGE',
        194 => 'EOS',
        14001 => 'WAXP',
        60 => 'ETH',
        61 => 'ETC',
        235 => 'FIO',
        6060 => 'GO',
        17 => 'GRS',
        74 => 'ICX',
        304 => 'IOTX',
        459 => 'KAVA',
        2017 => 'KIN',
        2 => 'LTC',
        22 => 'MONA',
        2718 => 'NAS',
        8964 => 'NULS',
        165 => 'XNO',
        397 => 'NEAR',
        242 => 'NIM',
        1024 => 'ONT',
        178 => 'POA',
        2301 => 'QTUM',
        144 => 'XRP',
        501 => 'SOL',
        148 => 'XLM',
        1729 => 'XTZ',
        500 => 'THETA',
        1001 => 'TT',
        888 => 'NEO',
        889 => 'VIC',
        195 => 'TRX',
        818 => 'VET',
        14 => 'VIA',
        5718350 => 'WAN',
        133 => 'ZEC',
        136 => 'FIRO',
        313 => 'ZIL',
        19167 => 'ZEL',
        175 => 'RVN',
        5741564 => 'WAVES',
        330 => 'LUNA',
        10000330 => 'LUNA2',
        1023 => 'ONE',
        283 => 'ALGO',
        434 => 'KSM',
        354 => 'DOT',
        461 => 'FIL',
        508 => 'EGLD',
        494 => 'BAND',
        10000714 => 'BSC',
        20000714 => 'BNB',
        30000714 => 'BNB',
        474 => 'ROSE',
        966 => 'MATIC',
        931 => 'RUNE',
        483 => 'BLZ',
        10000070 => 'OP',
        10000324 => 'ZKS',
        10042221 => 'ARB',
        10000553 => 'ECOC',
        10009000 => 'AVAX',
        10000100 => 'XDAI',
        10000250 => 'FTM',
        394 => 'CRO',
        52752 => 'CELO',
        10002020 => 'RON',
        10000118 => 'OSMO',
        899 => 'XEC',
        291 => 'IOST',
        10000025 => 'CRO',
        10000145 => 'BCH',
        10000321 => 'KCS',
        999 => 'BCD',
        10000288 => 'BOBA',
        57 => 'SYS',
        77 => 'XVG',
        121 => 'ZEN',
        10001088 => 'METIS',
        1323161554 => 'AURORA',
        10009001 => 'EVMOS',
        20009001 => 'EVMOS',
        10001285 => 'MOVR',
        10001284 => 'GLMR',
        10002222 => 'KAVA',
        10008217 => 'KLAY',
        18000 => 'MTRG',
        996 => 'OKT',
        105105 => 'STRAX',
        141 => 'KMD',
        309 => 'CKB',
        396 => 'EVER',
        637 => 'APT',
        146 => 'NEBL',
        3030 => 'HBAR',
        529 => 'SCRT',
        10000060 => 'INJ',
        564 => 'BLD',
        607 => 'TON',
        784 => 'SUI',
        20000118 => 'STARS',
        10001101 => 'POL',
        30000118 => 'JUNO',
        40000118 => 'STRD',
        50000118 => 'AXL',
        60000118 => 'CRE',
        70000118 => 'KUJI',
        10004689 => 'IOTX',
        10007700 => 'CANTO',
        80000118 => 'CMDX',
        90000118 => 'NTRN',
        11000118 => 'SOMM',
        12000118 => 'FET',
        13000118 => 'MARS',
        14000118 => 'UMEE',
        10000990 => 'COREUM',
        15000118 => 'QSR',
        16000118 => 'XPRT',
        17000118 => 'AKT',
        18000118 => 'NOBL',
        534352 => 'SCRL',
        137 => 'RSK',
        361 => 'TFUEL',
        1030 => 'CFX',
        787 => 'ACA',
        10000787 => 'ACA',
        204 => 'OPBNB',
        245022934 => 'NEON',
        8453 => 'BASE',
        19000118 => 'SEI',
        10042170 => 'ANOV',
        59144 => 'TBA',
        5600 => 'GNFD',
        5000 => 'MNT',
        7332 => 'ZEON',
        223 => 'ICP',
        21000118 => 'TIA',
        169 => 'MANTA',
        10007000 => 'ZETA',
        20007000 => 'ZETA',
        22000118 => 'DYDX',
        4200 => 'MERL',
        1890 => 'LL',
        81457 => 'BLAST',
        6001 => 'BB',
        810180 => 'ZKLN',
        _ => throw ArgumentError("Unknown value for CoinType: $value"),
    };

    bool validate(String address) {
        final obj = TWCoinType.fromValue(value);
        final addressString = StringImpl.createWithString(address);
        final result = _bindings.TWCoinTypeValidate(obj, addressString.pointer);
        addressString.dispose();

        return result;
    }

    String derivationPath() {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeDerivationPath(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String derivationPathWithDerivation(Derivation derivation) {
        final obj = TWCoinType.fromValue(value);
        final derivationEnum = TWDerivation.fromValue(derivation.value);
        final result = _bindings.TWCoinTypeDerivationPathWithDerivation(obj, derivationEnum);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String deriveAddress(PrivateKey privateKey) {
        final obj = TWCoinType.fromValue(value);
        final privateKeyPrivateKey = privateKey.pointer;
        final result = _bindings.TWCoinTypeDeriveAddress(obj, privateKeyPrivateKey);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    String deriveAddressFromPublicKey(PublicKey publicKey) {
        final obj = TWCoinType.fromValue(value);
        final publicKeyPublicKey = publicKey.pointer;
        final result = _bindings.TWCoinTypeDeriveAddressFromPublicKey(obj, publicKeyPublicKey);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    Blockchain get blockchain {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeBlockchain(obj);

        return Blockchain.fromValue(result.value);
    }

    
    Purpose get purpose {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypePurpose(obj);

        return Purpose.fromValue(result.value);
    }

    
    Curve get curve {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeCurve(obj);

        return Curve.fromValue(result.value);
    }

    
    HDVersion get xpubVersion {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeXpubVersion(obj);

        return HDVersion.fromValue(result.value);
    }

    
    HDVersion get xprvVersion {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeXprvVersion(obj);

        return HDVersion.fromValue(result.value);
    }

    
    HRP get hrp {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeHRP(obj);

        return HRP.fromValue(result.value);
    }

    
    int get p2pkhPrefix {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeP2pkhPrefix(obj);

        return result;
    }

    
    int get p2shPrefix {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeP2shPrefix(obj);

        return result;
    }

    
    int get staticPrefix {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeStaticPrefix(obj);

        return result;
    }

    
    String get chainId {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeChainId(obj);
        final wrapper = StringImpl.createWithPointer(result);
        final val = wrapper.dartString;
        wrapper.dispose();

        return val;
    }

    
    int get slip44Id {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeSlip44Id(obj);

        return result;
    }

    
    int get ss58Prefix {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypeSS58Prefix(obj);

        return result;
    }

    
    PublicKeyType get publicKeyType {
        final obj = TWCoinType.fromValue(value);
        final result = _bindings.TWCoinTypePublicKeyType(obj);

        return PublicKeyType.fromValue(result.value);
    }
}
