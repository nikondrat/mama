import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/auth/view/register_baby_name_screen.dart';
import 'package:mama/src/feature/auth/view/register_fill_another_baby_info_screen.dart';
import 'package:mama/src/feature/auth/view/register_info_about_childbirth.dart';

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
  static const String citySearch = 'citySearch';
  static const String welcomeScreen = 'welcomeScreen';

  static const servicesUserView = 'servicesUserView';
  static const servicesSleepMusicView = 'servicesSleepMusicView';

  static const profile = 'profile';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: '/',
  // initialLocation: _Paths.citySearch,
  routes: [
    GoRoute(
        path: _Paths.startScreen,
        name: AppViews.startScreen,
        builder: (context, state) => const StartScreen(),
        routes: [
          GoRoute(
              path: _Paths.register,
              name: AppViews.register,
              builder: (context, state) => const AuthView(),
              routes: [
                GoRoute(
                  path: _Paths.auth,
                  name: AppViews.auth,
                  builder: (context, state) => const AuthView(isLogin: true),
                ),
                GoRoute(
                  path: _Paths.registerVerify,
                  name: AppViews.registerVerify,
                  routes: [
                    GoRoute(
                        path: _Paths.authVerify,
                        name: AppViews.authVerify,
                        builder: (context, state) {
                          final Map? data = state.extra as Map?;
                          final String? phone = data!['phone'] as String?;
                          return PhoneVerify(
                            isLogin: true,
                            phone: phone ?? "",
                          );
                        }),
                  ],
                  builder: (context, state) {
                    final Map? data = state.extra as Map?;
                    final String? phone = data!['phone'] as String?;
                    return PhoneVerify(
                      phone: phone ?? "",
                    );
                  },
                ),
                GoRoute(
                    path: _Paths.welcomeScreen,
                    name: AppViews.welcomeScreen,
                    routes: [
                      GoRoute(
                          path: _Paths.registerFillName,
                          name: AppViews.registerFillName,
                          builder: (context, state) => const RegisterFillName(),
                          routes: [
                            GoRoute(
                                path: _Paths.registerFillBabyName,
                                name: AppViews.registerFillBabyName,
                                builder: (context, state) =>
                                    const RegisterBabyNameScreen(),
                                routes: [
                                  GoRoute(
                                      path: _Paths.registerFillAnotherBabyInfo,
                                      name:
                                          AppViews.registerFillAnotherBabyInfo,
                                      builder: (context, state) =>
                                          const RegisterFillAnotherBabyInfoScreen(),
                                      routes: [
                                        GoRoute(
                                            path: _Paths
                                                .registerInfoAboutChildbirth,
                                            name: AppViews
                                                .registerInfoAboutChildbirth,
                                            builder: (context, state) =>
                                                const RegisterInfoAboutChildbirth(),
                                            routes: [
                                              GoRoute(
                                                path: _Paths.citySearch,
                                                name: AppViews.citySearch,
                                                builder: (context, state) =>
                                                    const CitySearchView(),
                                              ),
                                            ]),
                                      ]),
                                ]),
                          ]),
                    ],
                    builder: (context, state) => const WelcomeScreen()),
                GoRoute(
                  path: _Paths.congratsScreen,
                  name: AppViews.congratsScreen,
                  builder: (context, state) => const CongratsScreen(),
                ),
              ]),
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
    GoRoute(
      path: _Paths.profile,
      name: AppViews.profile,
      builder: (context, state) => const ProfileScreen(),
    )
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
  static const String citySearch = AppViews.citySearch;
  static const String welcomeScreen = AppViews.welcomeScreen;

  static const servicesUserPath = '/${AppViews.servicesUserView}';
  static const servicesSleepMusicPath = AppViews.servicesSleepMusicView;

  static const profile = '/${AppViews.profile}';
}
