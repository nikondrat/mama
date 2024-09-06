import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:template/src/feature/auth/auth.dart';

abstract class AppViews {}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
    navigatorKey: navKey,
    routes: [
       GoRoute(
           path: '/',
           name: AuthScreen.routeName,
            builder: (context, state) => const AuthScreen(),
       )

]);

abstract class _Paths {}
