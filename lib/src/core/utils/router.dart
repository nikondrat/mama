import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/services/services_sleep_music/views/services_sleep_music_view.dart';
import 'package:mama/src/feature/services/services_user/views/services_user_view.dart';

abstract class AppViews {
  static const servicesUserView = ServicesUserView();
  static const servicesSleepMusicView = ServicesSleepMusicView();
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: _Paths.servicesUserPath,
  // debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: _Paths.servicesUserPath,
      builder: (context, state) => AppViews.servicesUserView,
      routes: [
        // GoRoute(
        //   path: _Paths.servicesSleepMusicPath,
        //   builder: (context, state) => AppViews.servicesSleepMusicView,
        // ),
      ],
    ),
  ],
);

abstract class _Paths {
  static const servicesUserPath = '/services-user-view';
  static const servicesSleepMusicPath = '/services-sleep-music-view';
}
