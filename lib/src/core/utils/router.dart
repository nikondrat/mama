import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/register/view/congrats_screen.dart';
import 'package:mama/src/feature/register/view/register_fill_name.dart';
import 'package:mama/src/feature/register/view/register_screen.dart';
import 'package:mama/src/feature/start_screen/start.dart';
import '../../feature/auth/auth.dart';

abstract class AppViews {
  static const String startScreen = 'startScreen';
  static const String auth = 'authScreen';
  static const String authVerify = 'authVerify';
  static const String registerVerify = 'registerVerify';
  static const String register = 'registerScreen';
  static const String congratsScreen = 'congrats';
  static const String registerFillName = 'registerFillName';
  static const String registerFillBabyName = 'registerFillBabyName';
  static const String registerFillAnotherBabyInfo = 'registerFillAnotherBabyInfo';
}

final GlobalKey<NavigatorState> navKey = GlobalKey();

final GoRouter router = GoRouter(
    navigatorKey: navKey,
    routes: [
       GoRoute(
           path: _Paths.startScreen,
           name: AppViews.startScreen,
            builder: (context, state) => const StartScreen(),
       ),GoRoute(
           path: _Paths.auth,
           name: AppViews.auth,
            builder: (context, state) => const AuthScreen(),
       ),
      GoRoute(
           path: _Paths.authVerify,
           name: AppViews.authVerify,
        builder: (context, state) =>  AuthVerifyScreen(phone: state.extra! as String,),
       ),
      GoRoute(
           path: _Paths.registerVerify,
           name: AppViews.registerVerify,
        builder: (context, state) =>  RegisterVerifyScreen(phone: state.extra! as String,),
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
            builder: (context, state) => const RegisterFillAnotherBabyInfoScreen(),
       ),

]);

abstract class _Paths {
  static const String startScreen = '/';
  static const String auth = '/authScreen';
  static const String authVerify = '/authVerify';
  static const String registerVerify = '/registerVerify';
  static const String register = '/register';
  static const String congratsScreen = '/congrats';
  static const String registerFillName = '/registerFillName';
  static const String registerFillBabyName = '/registerFillBabyName';
  static const String registerFillAnotherBabyInfo = '/registerFillAnotherBabyInfo';
}
