import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/logger_interceptor.dart';
import 'package:trust_wallet_core_example/di/dependency_scope.dart';
import 'package:trust_wallet_core_example/feature/app/app.dart';

Future<void> main() async {
  TrustWalletCore.init();

  final http = InterceptedHttp.build(interceptors: [
    LoggerInterceptor(),
  ]);

  runApp(
    DependencyScope(
      http: http,
      child: const App(),
    ),
  );
}
