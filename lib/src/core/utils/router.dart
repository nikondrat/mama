import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/auth/view/auth_screen.dart';
import 'package:mama/src/feature/auth/view/congrats_screen.dart';
import 'package:mama/src/feature/auth/view/register_fill_name_screen.dart';
import 'package:mama/src/feature/auth/view/register_screen.dart';
import 'package:mama/src/feature/auth/view/welcome_screen.dart';
import '../../feature/auth/view/register_city_screen.dart';
import 'package:mama/src/data.dart';

abstract class AppViews {
  static const String startScreen = 'startScreen';
  static const String auth = 'authScreen';
  static const String authVerify = 'authVerify';
  static const String registerVerify = 'registerVerify';
  static const String register = 'register';
  static const String congratsScreen = 'congrats';
  static const String registerFillName = 'registerFillName';
  static const String registerFillBabyName = 'registerFillBabyName';
  static const String registerFillAnotherBabyInfo =
      'registerFillAnotherBabyInfo';
  static const String registerInfoAboutChildbirth =
      'registerInfoAboutChildbirth';
  static const String registerCity = 'registerCity';
  static const String welcomeScreen = 'welcomeScreen';

  static const servicesUserView = 'servicesUserView';
  static const servicesSleepMusicView = 'servicesSleepMusicView';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  // initialLocation: _Paths.servicesUserPath,
  routes: [
    GoRoute(
        path: _Paths.startScreen,
        name: AppViews.startScreen,
        builder: (context, state) => const StartScreen(),
        routes: [
          GoRoute(
            path: _Paths.auth,
            name: AppViews.auth,
            builder: (context, state) => const AuthScreen(),
          ),
          GoRoute(
            path: _Paths.authVerify,
            name: AppViews.authVerify,
            builder: (context, state) => AuthVerifyScreen(
              phone: state.extra! as String,
            ),
          ),
          GoRoute(
            path: _Paths.registerVerify,
            name: AppViews.registerVerify,
            builder: (context, state) => RegisterVerifyScreen(
              phone: state.extra! as String,
            ),
          ),
          GoRoute(
            path: _Paths.register,
            name: AppViews.register,
            builder: (context, state) => const RegisterScreen(),
          ),
          GoRoute(
            path: _Paths.congratsScreen,
            name: AppViews.congratsScreen,
            builder: (context, state) => const CongratsScreen(),
          ),
          GoRoute(
            path: _Paths.registerFillName,
            name: AppViews.registerFillName,
            builder: (context, state) => const RegisterFillName(),
          ),
          GoRoute(
            path: _Paths.registerFillBabyName,
            name: AppViews.registerFillBabyName,
            builder: (context, state) => const RegisterBabyNameScreen(),
          ),
          GoRoute(
            path: _Paths.registerFillAnotherBabyInfo,
            name: AppViews.registerFillAnotherBabyInfo,
            builder: (context, state) =>
                const RegisterFillAnotherBabyInfoScreen(),
          ),
          GoRoute(
            path: _Paths.registerInfoAboutChildbirth,
            name: AppViews.registerInfoAboutChildbirth,
            builder: (context, state) => const RegisterInfoAboutChildbirth(),
          ),
          GoRoute(
            path: _Paths.registerCity,
            name: AppViews.registerCity,
            builder: (context, state) => const RegisterCityScreen(),
          ),
          GoRoute(
            path: _Paths.welcomeScreen,
            name: AppViews.welcomeScreen,
            builder: (context, state) => const WelcomeScreen(),
          ),
        ]),
    GoRoute(
      name: AppViews.servicesUserView,
      path: _Paths.servicesUserPath,
      builder: (context, state) => const ServicesUserView(),
      routes: [
        GoRoute(
          name: AppViews.servicesSleepMusicView,
          path: _Paths.servicesSleepMusicPath,
          builder: (context, state) => const ServicesSleepMusicView(),
        ),
      ],
    ),
  ],
);

abstract class _Paths {
  static const String startScreen = '/';
  static const String auth = AppViews.auth;
  static const String authVerify = AppViews.authVerify;
  static const String registerVerify = AppViews.registerVerify;
  static const String register = AppViews.register;
  static const String congratsScreen = AppViews.congratsScreen;
  static const String registerFillName = AppViews.registerFillName;
  static const String registerFillBabyName = AppViews.registerFillBabyName;
  static const String registerFillAnotherBabyInfo =
      AppViews.registerFillAnotherBabyInfo;
  static const String registerInfoAboutChildbirth =
      AppViews.registerInfoAboutChildbirth;
  static const String registerCity = AppViews.registerCity;
  static const String welcomeScreen = AppViews.welcomeScreen;

  static const servicesUserPath = '/${AppViews.servicesUserView}';
  static const servicesSleepMusicPath = AppViews.servicesSleepMusicView;
}
