import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/main/main.dart';

abstract class AppViews {
  static const breastScreen = 'brestScreen';
  static const startScreen = 'brestScreen';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: '/',
  routes: [
    GoRoute(
        path: _Paths.startScreen,
        name: AppViews.startScreen,
        builder: (context, state) => const BreastScreen(),
        ),
  ],
);

abstract class _Paths {
  static const String startScreen = '/';
}