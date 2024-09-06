// You have generated a new plugin project without specifying the `--platforms`
// flag. An FFI plugin project that supports no platforms is generated.
// To add platforms, run `flutter create -t plugin_ffi --platforms <platforms> .`
// in this directory. You can also find a detailed instruction on how to
// add platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'dart:ffi';
import 'dart:io';

import 'package:trust_wallet_core/src/bindings/generated_bindings.dart';

export 'src/index.dart';

const String _libName = 'WalletCore';

final class TrustWalletCore {
  late final DynamicLibrary _library;
  late final TrustWalletCoreBindings _bindings;

  DynamicLibrary get library => _library;
  TrustWalletCoreBindings get bindings => _bindings;

  Pointer<T> Function<T extends NativeType>(String symbolName) get lookup => library.lookup;

  void init() {
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
