// You have generated a new plugin project without specifying the `--platforms`
// flag. An FFI plugin project that supports no platforms is generated.
// To add platforms, run `flutter create -t plugin_ffi --platforms <platforms> .`
// in this directory. You can also find a detailed instruction on how to
// add platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'dart:ffi';
// import 'dart:io';

export 'src/bitcoin_script.dart';
export 'src/gen/ffi/generated_bindings.dart';
export 'src/common/index.dart';
// export 'src/gen/proto/index.dart';
export 'src/gen/proto/Bitcoin.pb.dart';

// const String _libName = 'trust_wallet_core';

final class TrustWalletCore {
  late final DynamicLibrary _library;

  DynamicLibrary get library => _library;

  Pointer<T> Function<T extends NativeType>(String symbolName) get lookup => library.lookup;

  void init() {
    //TODO: проверить
    _library = DynamicLibrary.open('libTrustWalletCore.dylib');

    // if (Platform.isMacOS || Platform.isIOS) {
    //   _library = DynamicLibrary.open('$_libName.framework/$_libName');
    // }
    // if (Platform.isAndroid || Platform.isLinux) {
    //   _library = DynamicLibrary.open('lib$_libName.so');
    // }
    // if (Platform.isWindows) {
    //   _library = DynamicLibrary.open('$_libName.dll');
    // }
    // throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
  }
}
