import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/services/services_sleep_music/views/services_sleep_music_view.dart';
import 'package:mama/src/feature/services/services_user/views/services_user_view.dart';
import 'package:mama/src/feature/trackers/views/trackers_evolution.dart';

abstract class AppViews {
  static const servicesUserView = ServicesUserView();
  static const servicesSleepMusicView = ServicesSleepMusicView();
  static const trackersEvolutionView = TrackersEvolutionView();
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: _Paths.trackersEvolutionPath,
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
    GoRoute(
      path: _Paths.trackersEvolutionPath,
      builder: (context, state) => AppViews.trackersEvolutionView,
    ),
  ],
);

abstract class _Paths {
  static const servicesUserPath = '/services-user-view';
  static const servicesSleepMusicPath = '/services-sleep-music-view';
  static const trackersEvolutionPath = '/trackers-evolution-view';
}
