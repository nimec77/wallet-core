import 'dart:ffi';
import 'dart:typed_data';

import 'package:trust_wallet_core/trust_wallet_core.dart';

abstract interface class HdWallet {
  void create();
  void createWithMnemonic(String mnemonic, {String passphrase = ''});
  String getAddressForCoin(TWCoinType coinType);
  Uint8List getKeyForCoin(TWCoinType coinType);
  signerPlan(
    Uint8List bytes,
    TWCoinType coin,
  );
  bool mnemonicIsValid(String mnemonic);
  String mnemonic();
}

class HdWalletImpl implements HdWallet, Disposable {
  final TrustWalletCoreBindings _bindings;
  late final Pointer<TWHDWallet> _walletPointer;

  HdWalletImpl(this._bindings);

  @override
  void create() {
    final stringData = StringImpl.createWithString(_bindings, '');
    _walletPointer = _bindings.TWHDWalletCreate(
      128,
      stringData.pointer,
    );

    stringData.dispose();
  }

  @override
  void createWithMnemonic(String mnemonic, {String passphrase = ''}) {
    if (!mnemonicIsValid(mnemonic)) throw Exception('Mnemonic is invalid');

    final mnemonicData = StringImpl.createWithString(_bindings, mnemonic);
    final passphraseData = StringImpl.createWithString(_bindings, passphrase);

    _walletPointer = _bindings.TWHDWalletCreateWithMnemonic(
      mnemonicData.pointer,
      passphraseData.pointer,
    );

    mnemonicData.dispose();
    passphraseData.dispose();
  }

  @override
  String getAddressForCoin(TWCoinType coinType) {
    final Pointer<TWString> addressPointer = _bindings.TWHDWalletGetAddressForCoin(_walletPointer, coinType);
    final addressData = StringImpl.createWithPointer(_bindings, addressPointer);
    final address = addressData.dartString;
    addressData.dispose();
    return address;
  }

  @override
  Uint8List getKeyForCoin(TWCoinType coinType) {
    //TODO: детерменировать поинтеры и обрабатывать данные с помощью DataImpl
    final Pointer<TWPrivateKey> pointer = _bindings.TWHDWalletGetKeyForCoin(_walletPointer, coinType);
    final Pointer<Void> data = _bindings.TWPrivateKeyData(pointer);

    return _bindings.TWDataBytes(data).asTypedList(_bindings.TWDataSize(data));
  }

  @override
  signerPlan(Uint8List bytes, TWCoinType coin) {
    // TODO: implement signerPlan
    throw UnimplementedError();
  }

  @override
  bool mnemonicIsValid(String mnemonic) {
    final stringData = StringImpl.createWithString(_bindings, mnemonic);
    final mnemonicIsValid = _bindings.TWMnemonicIsValid(stringData.pointer);
    stringData.dispose();

    return mnemonicIsValid;
  }

  @override
  void dispose() => _bindings.TWHDWalletDelete(_walletPointer);

  @override
  String mnemonic() {
    final Pointer<TWString1> mnemonicPointer = _bindings.TWHDWalletMnemonic(_walletPointer);
    final stringData = StringImpl.createWithPointer(_bindings, mnemonicPointer);
    final mnemonic = stringData.dartString;
    stringData.dispose();
    return mnemonic;
  }
}
