import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

import 'package:mama/src/feature/auth/view/register_baby_name_screen.dart';
import 'package:mama/src/feature/auth/view/register_fill_another_baby_info_screen.dart';
import 'package:mama/src/feature/auth/view/register_info_about_childbirth.dart';
import 'package:mama/src/feature/trackers/views/trackers_health_add_temperature.dart';
import 'package:mama/src/feature/trackers/views/trackers_health_view.dart';

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

  static const String homeScreen = 'homeScreen';

  static const trackersHealthView = 'trackersHealthView';
  static const trackersHealthAddTemperatureView =
      'trackersHealthAddTemperatureView';

  static const servicesUserView = 'servicesUserView';
  static const servicesSleepMusicView = 'servicesSleepMusicView';
  static const evolutionView = 'evolutionView';

  static const addWeightView = 'addWeightView';

  static const profile = 'profile';
  static const promoView = 'promoView';

  static const chatView = 'chatView';

  static const feeding = 'feeding';
  static const addManually = 'addManually';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  initialLocation: '/',
  // initialLocation: _Paths.homeScreen,
  routes: [
    GoRoute(
      path: _Paths.startScreen,
      name: AppViews.startScreen,

      /// TODO: change before merge
      builder: (context, state) => const HomeView(),
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
                        phone: phone ?? '',
                      );
                    }),
              ],
              builder: (context, state) {
                final Map? data = state.extra as Map?;
                final String? phone = data!['phone'] as String?;
                return PhoneVerify(
                  phone: phone ?? '',
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
                          name: AppViews.registerFillAnotherBabyInfo,
                          builder: (context, state) =>
                              const RegisterFillAnotherBabyInfoScreen(),
                          routes: [
                            GoRoute(
                              path: _Paths.registerInfoAboutChildbirth,
                              name: AppViews.registerInfoAboutChildbirth,
                              builder: (context, state) =>
                                  const RegisterInfoAboutChildbirth(),
                              routes: [
                                GoRoute(
                                  path: _Paths.citySearch,
                                  name: AppViews.citySearch,
                                  builder: (context, state) =>
                                      const CitySearchView(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
              builder: (context, state) => const WelcomeScreen(),
            ),
            GoRoute(
              path: _Paths.congratsScreen,
              name: AppViews.congratsScreen,
              builder: (context, state) => const CongratsScreen(),
            ),
          ],
        ),
      ],
    ),
    
    GoRoute(
      path: _Paths.homeScreen,
      name: AppViews.homeScreen,
      builder: (context, state) => const HomeView(),
      routes: [
        GoRoute(
          name: AppViews.servicesUserView,
          path: _Paths.servicesUserPath,
          builder: (context, state) => const ServicesUserView(
            appBar: CustomAppBar(),
          ),
          routes: [
            GoRoute(
              name: AppViews.servicesSleepMusicView,
              path: _Paths.servicesSleepMusicPath,
              builder: (context, state) {
                final Map? extra = state.extra as Map?;
                final int? selectedTab = extra?['selectedTab'] as int?;

                return ServicesSleepMusicView(
                  index: selectedTab,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: _Paths.evolutionView,
          name: AppViews.evolutionView,
          builder: (context, state) => const EvolutionView(),
          routes: [
            GoRoute(
              name: AppViews.addWeightView,
              path: _Paths.addWeightView,
              builder: (context, state) => const AddWeight(),
            )
          ],
        ),
        GoRoute(
          path: _Paths.feeding,
          name: AppViews.feeding,
          builder: (context, state) => const FeedingScreen(),
          routes: [
            GoRoute(
              name: AppViews.addManually,
              path: _Paths.addManually,
              builder: (context, state) => const AddManuallyScreen(),
            ),
          ],
        ),
        GoRoute(
          name: AppViews.trackersHealthView,
          path: _Paths.trackersHealthPath,
          builder: (context, state) => const TrackersHealthView(),
          routes: [
            GoRoute(
              name: AppViews.trackersHealthAddTemperatureView,
              path: _Paths.trackersHealthAddTemperaturePath,
              builder: (context, state) => const TrackersHealthAddTemperature(),
            )
          ],
        ),
        GoRoute(
          path: _Paths.profile,
          name: AppViews.profile,
          builder: (context, state) => const ProfileScreen(),
          routes: [
            GoRoute(
              path: _Paths.promoView,
              name: AppViews.promoView,
              builder: (context, state) => const PromoScreen(),
            )
          ],
        ),
        GoRoute(
          path: _Paths.chatView,
          name: AppViews.chatView,
          builder: (context, state) => const ChatsScreen(
            appBar: CustomAppBar(),
          ),
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
  static const String citySearch = AppViews.citySearch;
  static const String welcomeScreen = AppViews.welcomeScreen;

  static const String homeScreen = '/${AppViews.homeScreen}';

  static const trackersHealthPath = AppViews.trackersHealthView;
  static const trackersHealthAddTemperaturePath =
      AppViews.trackersHealthAddTemperatureView;

  static const servicesUserPath = AppViews.servicesUserView;
  static const servicesSleepMusicPath = AppViews.servicesSleepMusicView;
  static const evolutionView = AppViews.evolutionView;

  static const addWeightView = AppViews.addWeightView;

  static const profile = AppViews.profile;
  static const promoView = AppViews.promoView;

  static const chatView = AppViews.chatView;

  static const feeding = AppViews.feeding;

  static const addManually = AppViews.addManually;
}
