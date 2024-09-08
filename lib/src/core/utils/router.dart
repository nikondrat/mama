import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

abstract class AppViews {
  static const servicesUserView = 'services-user-view';
  static const servicesSleepMusicView = 'services-sleep-music-view';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: _Paths.servicesUserPath,
  // debugLogDiagnostics: true,
  routes: [
    GoRoute(
      name: AppViews.servicesUserView,
      path: _Paths.servicesUserPath,
      builder: (context, state) => ServicesUserView(),
      routes: [
        GoRoute(
          name: AppViews.servicesSleepMusicView,
          path: _Paths.servicesSleepMusicPath,
          builder: (context, state) => ServicesSleepMusicView(),
        ),
      ],
    ),
  ],
);

abstract class _Paths {
  static const servicesUserPath = '/${AppViews.servicesUserView}';
  static const servicesSleepMusicPath = AppViews.servicesSleepMusicView;
}
