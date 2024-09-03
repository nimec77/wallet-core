import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:trust_wallet_core/trust_wallet_core.dart';
import 'package:trust_wallet_core_example/data/hd_wallet.dart';

class DependencyScope extends InheritedWidget {
  final TrustWalletCoreBindings bindings;
  final HdWallet hdWallet;
  final InterceptedHttp http;

  const DependencyScope({
    super.key,
    required this.bindings,
    required this.hdWallet,
    required this.http,
    required super.child,
  });

  static DependencyScope of(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<DependencyScope>()!.widget as DependencyScope;

  @override
  bool updateShouldNotify(DependencyScope oldWidget) => false;
}
