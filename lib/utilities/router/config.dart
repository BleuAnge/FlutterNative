import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:native_test/utilities/router/main_shell.dart';

final GlobalKey<NavigatorState> _mainkey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _mainkey,
  initialLocation: "/home",
  routes: [
    GoRoute(
      name: "DefaultPage",
      path: "/",
      pageBuilder: (context, state) {
        return MaterialPage(child: Container());
      },
    ),
    mainShellRoute,
  ]
);