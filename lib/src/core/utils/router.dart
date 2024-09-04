import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class AppViews {}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(navigatorKey: navKey, routes: []);

abstract class _Paths {}
