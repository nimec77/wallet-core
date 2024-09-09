// You have generated a new plugin project without specifying the `--platforms`
// flag. An FFI plugin project that supports no platforms is generated.
// To add platforms, run `flutter create -t plugin_ffi --platforms <platforms> .`
// in this directory. You can also find a detailed instruction on how to
// add platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'src/index.dart';

part 'package:trust_wallet_core/src/common/data_impl.dart';
part 'package:trust_wallet_core/src/common/string_impl.dart';
part 'package:trust_wallet_core/src/extensions/extensions.dart';
part 'package:trust_wallet_core/src/generated/any_signer.dart';
part 'package:trust_wallet_core/src/generated/bitcoin_script.dart';
part 'package:trust_wallet_core/src/generated/hd_wallet.dart';
part 'package:trust_wallet_core/src/generated/private_key.dart';
part 'package:trust_wallet_core/src/generated/public_key.dart';

const String _libName = 'WalletCore';

late final DynamicLibrary _library;
late final TrustWalletCoreBindings _bindings;

abstract class TrustWalletCore {
  const TrustWalletCore._();

  DynamicLibrary get library => _library;
  TrustWalletCoreBindings get bindings => _bindings;

  static void init() {
    if (Platform.isMacOS || Platform.isIOS) {
      _library = DynamicLibrary.open('$_libName.framework/$_libName');
    } else if (Platform.isAndroid || Platform.isLinux) {
      _library = DynamicLibrary.open('lib$_libName.so');
    } else if (Platform.isWindows) {
      _library = DynamicLibrary.open('$_libName.dll');
    } else {
      throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
    }

    _bindings = TrustWalletCoreBindings(_library);
  }
}
