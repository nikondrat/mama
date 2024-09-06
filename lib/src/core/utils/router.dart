import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/feature/services/services_user/views/services_user_view.dart';

abstract class AppViews {
  static const servicesUserView = ServicesUserView();
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
    ),
  ],
);

abstract class _Paths {
  static const servicesUserPath = '/services-user-view';
}
