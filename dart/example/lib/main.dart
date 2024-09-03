import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/hd_wallet.dart';
import 'package:trust_wallet_core_example/data/logger_interceptor.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';
import 'package:trust_wallet_core_example/feature/app/app.dart';

Future<void> main() async {
  libraryTest();

  final plugin = TrustWalletCore()..init();
  final bindings = TrustWalletCoreBindings(plugin.library);
  final hdWallet = HdWalletImpl(bindings);
  final http = InterceptedHttp.build(interceptors: [
    LoggerInterceptor(),
  ]);

  runApp(
    DependencyScope(
      bindings: bindings,
      hdWallet: hdWallet,
      http: http,
      child: const App(),
    ),
  );
}

void libraryTest() {
  var lib = DynamicLibrary.open('WalletCore.framework/WalletCore');
  late final TWStringCreateWithUTF8BytesPtr =
      lib.lookup<NativeFunction<Pointer<Void> Function(Pointer<Char>)>>('TWStringCreateWithUTF8Bytes');
  late final TWStringCreateWithUTF8Bytes =
      TWStringCreateWithUTF8BytesPtr.asFunction<Pointer<Void> Function(Pointer<Char>)>();
  var pointer = TWStringCreateWithUTF8Bytes(
    'string'.toNativeUtf8().cast(),
  );
  print(pointer.address);
}
