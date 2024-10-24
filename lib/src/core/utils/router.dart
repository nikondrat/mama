import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  static const String citySearch = 'citySearch';
  static const String welcomeScreen = 'welcomeScreen';

  static const String homeScreen = 'homeScreen';

  static const trackersHealthView = 'trackersHealthView';
  static const addTemperature = 'addTemperature';

  static const trackersHealthAddMedicineView = 'trackersHealthAddMedicineView';

  // static const healthMedicine = '/';
  static const addMedicine = 'addMedicine';

  static const servicesUserView = 'servicesUserView';
  static const servicesSleepMusicView = 'servicesSleepMusicView';
  static const evolutionView = 'evolutionView';

  static const addWeightView = 'addWeightView';
  static const addGrowthView = 'addGrowthView';
  static const addHeadView = 'addHeadView';

  static const profile = 'profile';
  static const promoView = 'promoView';

  static const chatView = 'chatView';

  static const feeding = 'feeding';
  static const addManually = 'addManually';

  static const diapersView = 'diapersView';
  static const addDiaper = 'addDiaper';

  static const docs = 'docs';
  static const doc = 'doc';

  static const consultation = 'consultation';
  static const consultations = 'consultations';

  static const webView = 'webView';
  static const pdfView = 'pdfView';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
  navigatorKey: navKey,
  // initialLocation: '/',
  initialLocation:
      '${_Paths.registerFillBabyName}/${_Paths.registerFillAnotherBabyInfo}/${_Paths.registerInfoAboutChildbirth}/${_Paths.citySearch}',
  routes: [
    GoRoute(
        path: _Paths.webView,
        name: AppViews.webView,
        builder: (context, state) {
          final Map? extra = state.extra as Map?;
          final String url = extra?['url'] as String;

          return WebView(
            url: url,
          );
        }),
    GoRoute(
        path: _Paths.pdfView,
        name: AppViews.pdfView,
        builder: (context, state) {
          final Map? extra = state.extra as Map?;
          final String path = extra?['path'] as String;

          return PdfView(
            path: path,
          );
        }),
    GoRoute(
        path: _Paths.docs,
        name: AppViews.docs,
        builder: (context, state) {
          return const DocsView();
        },
        routes: [
          GoRoute(
            path: _Paths.doc,
            name: AppViews.doc,
            builder: (context, state) {
              return const DocView();
            },
          ),
        ]),
    GoRoute(
      path: _Paths.startScreen,
      name: AppViews.startScreen,
      builder: (context, state) => const StartScreen(),
    ),
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
                  return const PhoneVerify(
                    isLogin: true,
                  );
                }),
          ],
          builder: (context, state) {
            return const PhoneVerify();
          },
        ),
        GoRoute(
            path: _Paths.welcomeScreen,
            name: AppViews.welcomeScreen,
            routes: [
              GoRoute(
                path: _Paths.registerFillName,
                name: AppViews.registerFillName,
                builder: (context, state) {
                  return const RegisterFillName();
                },
              ),
            ],
            builder: (context, state) => const WelcomeScreen()),
        GoRoute(
          path: _Paths.congratsScreen,
          name: AppViews.congratsScreen,
          builder: (context, state) => const CongratsScreen(),
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
                path: _Paths.consultations,
                name: AppViews.consultations,
                routes: [
                  GoRoute(
                    path: _Paths.consultation,
                    name: AppViews.consultation,
                    builder: (context, state) {
                      final Map? extra = state.extra as Map?;
                      final DoctorModel? doctor =
                          extra?['doctor'] as DoctorModel?;
                      return ConsultationView(
                        doctor: doctor,
                      );
                    },
                  )
                ],
                builder: (context, state) {
                  final Map? extra = state.extra as Map?;
                  final int? selectedTab = extra?['selectedTab'] as int?;

                  return ConsultationsView(
                    initialIndex: selectedTab ?? 0,
                  );
                }),
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
            ),
            GoRoute(
              path: _Paths.addGrowthView,
              name: AppViews.addGrowthView,
              builder: (context, state) => const AddGrowth(),
            ),
            GoRoute(
              path: _Paths.addHeadView,
              name: AppViews.addHeadView,
              builder: (context, state) => const AddHead(),
            ),
          ],
        ),
        GoRoute(
            name: AppViews.diapersView,
            path: _Paths.diapersView,
            builder: (context, state) => const DiapersView(),
            routes: [
              GoRoute(
                name: AppViews.addDiaper,
                path: _Paths.addDiaper,
                builder: (context, state) => const AddDiaper(),
              ),
            ]),
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
              name: AppViews.addTemperature,
              path: _Paths.trackersHealthAddTemperaturePath,
              builder: (context, state) => const TrackersHealthAddTemperature(),
            ),
            GoRoute(
              path: _Paths.addMedicine,
              name: AppViews.addMedicine,
              builder: (context, state) => const AddMedicine(),
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
      ],
    ),
    GoRoute(
      path: _Paths.registerFillBabyName,
      name: AppViews.registerFillBabyName,
      builder: (context, state) {
        final Map? extra = state.extra as Map?;
        final bool? isNotRegister = extra?['isNotRegister'] as bool?;

        return RegisterBabyNameScreen(
          isNotRegister: isNotRegister ?? false,
        );
      },
      routes: [
        GoRoute(
          path: _Paths.registerFillAnotherBabyInfo,
          name: AppViews.registerFillAnotherBabyInfo,
          builder: (context, state) {
            final Map? extra = state.extra as Map?;
            final bool? isNotRegister = extra?['isNotRegister'] as bool?;

            return RegisterFillAnotherBabyInfoScreen(
              isNotRegister: isNotRegister ?? false,
            );
          },
          routes: [
            GoRoute(
              path: _Paths.registerInfoAboutChildbirth,
              name: AppViews.registerInfoAboutChildbirth,
              builder: (context, state) {
                final Map? extra = state.extra as Map?;
                final bool? isNotRegister = extra?['isNotRegister'] as bool?;

                return RegisterInfoAboutChildbirth(
                  isNotRegister: isNotRegister ?? false,
                );
              },
              routes: [
                GoRoute(
                  path: _Paths.citySearch,
                  name: AppViews.citySearch,
                  builder: (context, state) {
                    return const CitySearchView();
                  },
                ),
              ],
            ),
          ],
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
  static const String register = '/${AppViews.register}';
  static const String congratsScreen = AppViews.congratsScreen;
  static const String registerFillName = AppViews.registerFillName;
  static const String registerFillBabyName =
      '/${AppViews.registerFillBabyName}';
  static const String registerFillAnotherBabyInfo =
      AppViews.registerFillAnotherBabyInfo;
  static const String registerInfoAboutChildbirth =
      AppViews.registerInfoAboutChildbirth;
  static const String citySearch = AppViews.citySearch;
  static const String welcomeScreen = AppViews.welcomeScreen;

  static const String homeScreen = '/${AppViews.homeScreen}';

  static const trackersHealthPath = AppViews.trackersHealthView;
  static const trackersHealthAddTemperaturePath = AppViews.addTemperature;

  // static const healthMedicine = AppViews.healthMedicine;
  static const addMedicine = AppViews.addMedicine;

  static const servicesUserPath = AppViews.servicesUserView;
  static const servicesSleepMusicPath = AppViews.servicesSleepMusicView;
  static const evolutionView = AppViews.evolutionView;

  static const addWeightView = AppViews.addWeightView;
  static const addGrowthView = AppViews.addGrowthView;
  static const addHeadView = AppViews.addHeadView;

  static const profile = AppViews.profile;
  static const promoView = AppViews.promoView;

  static const feeding = AppViews.feeding;

  static const addManually = AppViews.addManually;

  static const diapersView = AppViews.diapersView;
  static const addDiaper = AppViews.addDiaper;

  static const docs = '/${AppViews.docs}';
  static const doc = AppViews.doc;

  static const consultation = AppViews.consultation;
  static const consultations = AppViews.consultations;

  static const webView = '/${AppViews.webView}';
  static const pdfView = '/${AppViews.pdfView}';
}
