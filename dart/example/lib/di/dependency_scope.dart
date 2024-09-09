import 'package:flutter/material.dart';
import 'package:http_interceptor/http_interceptor.dart';

class DependencyScope extends InheritedWidget {
  final InterceptedHttp http;

  const DependencyScope({
    super.key,
    required this.http,
    required super.child,
  });

  static DependencyScope of(BuildContext context) =>
      context.getElementForInheritedWidgetOfExactType<DependencyScope>()!.widget as DependencyScope;

  @override
  bool updateShouldNotify(DependencyScope oldWidget) => false;
}
