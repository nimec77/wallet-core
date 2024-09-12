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
    poanetwork(178),
    qtum(2301),
    xrp(144),
    solana(501),
    stellar(148),
    tezos(1729),
    theta(500),
    thunderCore(1001),
    neo(888),
    tomoChain(889),
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
    oasis(474),
    polygon(966),
    thorchain(931),
    bluzelle(483),
    optimism(10000070),
    zksync(10000324),
    arbitrum(10042221),
    ecochain(10000553),
    avalancheCChain(10009000),
    xdai(10000100),
    fantom(10000250),
    cryptoOrg(394),
    celo(52752),
    ronin(10002020),
    osmosis(10000118),
    ecash(899),
    cronosChain(10000025),
    smartBitcoinCash(10000145),
    kuCoinCommunityChain(10000321),
    boba(10000288),
    metis(10001088),
    aurora(1323161554),
    evmos(10009001),
    nativeEvmos(20009001),
    moonriver(10001285),
    moonbeam(10001284),
    kavaEvm(10002222),
    klaytn(10008217),
    meter(18000),
    okxchain(996),
    nervos(309),
    everscale(396),
    aptos(637),
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
    noble(18000118);

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
        178 => poanetwork,
        2301 => qtum,
        144 => xrp,
        501 => solana,
        148 => stellar,
        1729 => tezos,
        500 => theta,
        1001 => thunderCore,
        888 => neo,
        889 => tomoChain,
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
        474 => oasis,
        966 => polygon,
        931 => thorchain,
        483 => bluzelle,
        10000070 => optimism,
        10000324 => zksync,
        10042221 => arbitrum,
        10000553 => ecochain,
        10009000 => avalancheCChain,
        10000100 => xdai,
        10000250 => fantom,
        394 => cryptoOrg,
        52752 => celo,
        10002020 => ronin,
        10000118 => osmosis,
        899 => ecash,
        10000025 => cronosChain,
        10000145 => smartBitcoinCash,
        10000321 => kuCoinCommunityChain,
        10000288 => boba,
        10001088 => metis,
        1323161554 => aurora,
        10009001 => evmos,
        20009001 => nativeEvmos,
        10001285 => moonriver,
        10001284 => moonbeam,
        10002222 => kavaEvm,
        10008217 => klaytn,
        18000 => meter,
        996 => okxchain,
        309 => nervos,
        396 => everscale,
        637 => aptos,
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
