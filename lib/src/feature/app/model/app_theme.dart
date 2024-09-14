import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'app_theme.g.dart';

class AppThemeStore extends _AppThemeStore with _$AppThemeStore {
  AppThemeStore({required super.mode, required super.seed});
}

abstract class _AppThemeStore with Store {
  _AppThemeStore({required this.mode, required this.seed})
      : lightTheme = FlexThemeData.light(
            fontFamily: "SFProText",
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: seed,
              primary: AppColors.primaryColor,
            ),
    textTheme: const TextTheme(
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w700,
      ),
      displaySmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      bodyMedium: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
      labelMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700
      ) ,
      labelLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700
      ),
    )
  ),
        darkTheme = FlexThemeData.dark(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: seed));

  /// The type of theme to use.
  @observable
  ThemeMode mode;

  /// The seed color to generate the [ColorScheme] from.
  @observable
  Color seed;

  /// The dark [ThemeData] for this [AppThemeStore].
  @observable
  ThemeData darkTheme;

  /// The light [ThemeData] for this [AppThemeStore].
  @observable
  ThemeData lightTheme;

  @action

  /// The [ThemeData] for this [AppThemeStore].
  /// This is computed based on the [mode].
  ThemeData computeTheme() {
    switch (mode) {
      case ThemeMode.light:
        return lightTheme;
      case ThemeMode.dark:
        return darkTheme;
      case ThemeMode.system:
        return PlatformDispatcher.instance.platformBrightness == Brightness.dark
            ? darkTheme
            : lightTheme;
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppThemeStore && seed == other.seed && mode == other.mode;

  @override
  int get hashCode => Object.hash(seed, mode);
}
