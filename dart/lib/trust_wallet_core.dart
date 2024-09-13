// SPDX-License-Identifier: Apache-2.0
//
// Copyright © 2017 Trust Wallet.
//
// This is a GENERATED FILE, changes made here WILL BE LOST.
//

import 'src/index.dart';

part 'package:trust_wallet_core/src/common/any_signer.dart';
part 'package:trust_wallet_core/src/common/data_impl.dart';
part 'package:trust_wallet_core/src/common/string_impl.dart';
part 'package:trust_wallet_core/src/extensions/extensions.dart';
part 'package:trust_wallet_core/src/generated/account.dart';
part 'package:trust_wallet_core/src/generated/aes.dart';
part 'package:trust_wallet_core/src/generated/any_address.dart';
part 'package:trust_wallet_core/src/generated/barz.dart';
part 'package:trust_wallet_core/src/generated/base_32.dart';
part 'package:trust_wallet_core/src/generated/base_58.dart';
part 'package:trust_wallet_core/src/generated/base_64.dart';
part 'package:trust_wallet_core/src/generated/bitcoin_address.dart';
part 'package:trust_wallet_core/src/generated/bitcoin_message_signer.dart';
part 'package:trust_wallet_core/src/generated/bitcoin_script.dart';
part 'package:trust_wallet_core/src/generated/cardano.dart';
part 'package:trust_wallet_core/src/generated/coin_type_configuration.dart';
part 'package:trust_wallet_core/src/generated/data_vector.dart';
part 'package:trust_wallet_core/src/generated/derivation_path.dart';
part 'package:trust_wallet_core/src/generated/derivation_path_index.dart';
part 'package:trust_wallet_core/src/generated/enums/aes_padding_mode.dart';
part 'package:trust_wallet_core/src/generated/enums/bitcoin_sig_hash_type.dart';
part 'package:trust_wallet_core/src/generated/enums/blockchain.dart';
part 'package:trust_wallet_core/src/generated/enums/coin_type.dart';
part 'package:trust_wallet_core/src/generated/enums/curve.dart';
part 'package:trust_wallet_core/src/generated/enums/derivation.dart';
part 'package:trust_wallet_core/src/generated/enums/ethereum_chain_id.dart';
part 'package:trust_wallet_core/src/generated/enums/filecoin_address_type.dart';
part 'package:trust_wallet_core/src/generated/enums/hd_version.dart';
part 'package:trust_wallet_core/src/generated/enums/hrp.dart';
part 'package:trust_wallet_core/src/generated/enums/private_key_type.dart';
part 'package:trust_wallet_core/src/generated/enums/public_key_type.dart';
part 'package:trust_wallet_core/src/generated/enums/purpose.dart';
part 'package:trust_wallet_core/src/generated/enums/ss_58_address_type.dart';
part 'package:trust_wallet_core/src/generated/enums/stellar_memo_type.dart';
part 'package:trust_wallet_core/src/generated/enums/stellar_passphrase.dart';
part 'package:trust_wallet_core/src/generated/enums/stellar_version_byte.dart';
part 'package:trust_wallet_core/src/generated/enums/stored_key_encryption.dart';
part 'package:trust_wallet_core/src/generated/enums/stored_key_encryption_level.dart';
part 'package:trust_wallet_core/src/generated/ethereum.dart';
part 'package:trust_wallet_core/src/generated/ethereum_abi.dart';
part 'package:trust_wallet_core/src/generated/ethereum_abi_function.dart';
part 'package:trust_wallet_core/src/generated/ethereum_abi_value.dart';
part 'package:trust_wallet_core/src/generated/ethereum_message_signer.dart';
part 'package:trust_wallet_core/src/generated/filecoin_address_converter.dart';
part 'package:trust_wallet_core/src/generated/fio_account.dart';
part 'package:trust_wallet_core/src/generated/groestlcoin_address.dart';
part 'package:trust_wallet_core/src/generated/hash.dart';
part 'package:trust_wallet_core/src/generated/hd_wallet.dart';
part 'package:trust_wallet_core/src/generated/liquid_staking.dart';
part 'package:trust_wallet_core/src/generated/mnemonic.dart';
part 'package:trust_wallet_core/src/generated/near_account.dart';
part 'package:trust_wallet_core/src/generated/nervos_address.dart';
part 'package:trust_wallet_core/src/generated/pbkdf_2.dart';
part 'package:trust_wallet_core/src/generated/private_key.dart';
part 'package:trust_wallet_core/src/generated/public_key.dart';
part 'package:trust_wallet_core/src/generated/ripple_x_address.dart';
part 'package:trust_wallet_core/src/generated/segwit_address.dart';
part 'package:trust_wallet_core/src/generated/solana_address.dart';
part 'package:trust_wallet_core/src/generated/stark_ex_message_signer.dart';
part 'package:trust_wallet_core/src/generated/stark_ware.dart';
part 'package:trust_wallet_core/src/generated/stored_key.dart';
part 'package:trust_wallet_core/src/generated/tezos_message_signer.dart';
part 'package:trust_wallet_core/src/generated/thor_chain_swap.dart';
part 'package:trust_wallet_core/src/generated/transaction_compiler.dart';
part 'package:trust_wallet_core/src/generated/tron_message_signer.dart';

late final DynamicLibrary _library;
late final TrustWalletCoreBindings _bindings;

abstract final class TrustWalletCore {
  const TrustWalletCore._();

  static void init() {
    String dllPath;

    if (Platform.isMacOS || Platform.isIOS) {
      dllPath = 'WalletCore.framework/WalletCore';
    } else if (Platform.isAndroid) {
      dllPath = 'libTrustWalletCore.so';
    } else if (Platform.isWindows) {
      if (Platform.environment['PROCESSOR_ARCHITECTURE'] == 'AMD64' ||
          Platform.environment['PROCESSOR_ARCHITEW6432'] == 'AMD64') {
        dllPath = 'windows/libs/64/TrustWalletCore.dll';
      } else if (Platform.environment['PROCESSOR_ARCHITECTURE'] == 'ARM64') {
        dllPath = 'windows/libs/arm64/TrustWalletCore.dll';
      } else {
        dllPath = 'windows/libs/86/TrustWalletCore.dll';
      }
    } else {
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }

    if (dllPath.isEmpty) {
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }

    _library = DynamicLibrary.open(dllPath);
    _bindings = TrustWalletCoreBindings(_library);
  }
}
