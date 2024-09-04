// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import 'package:template/src/data.dart';

part 'settings_store.g.dart';

class SettingsStore extends _SettingsStore with _$SettingsStore {
  SettingsStore({
    required super.localeRepository,
    required super.themeRepository,
    required super.locale,
    required super.appTheme,
  });
}

abstract class _SettingsStore with Store {
  _SettingsStore({
    required this.localeRepository,
    required this.themeRepository,
    required this.locale,
    required this.appTheme,
  });

  final LocaleRepository localeRepository;
  final ThemeRepository themeRepository;

  /// Get the current [Locale]
  @observable
  Locale locale;

  /// Get the current [AppThemeStore].
  @observable
  AppThemeStore appTheme;

  /// Get the current [lightTheme].
  @computed
  ThemeData get lightTheme => appTheme.lightTheme;

  /// Get the current [darkTheme].
  @computed
  ThemeData get darkTheme => appTheme.darkTheme;

  /// Get the current [themeMode].
  @computed
  ThemeMode get themeMode => appTheme.mode;

  /// Set locale to [locale].
  @action
  void setLocale(Locale locale) {
    this.locale = locale;
  }

  /// Set the theme mode to [theme].
  @action
  setTheme(AppThemeStore theme) {
    appTheme = theme;
  }

  /// Update the theme mode to [theme].
  @action
  Future<void> updateTheme(AppThemeStore theme) async {
    themeRepository.setTheme(theme);
  }

  /// Update locale to [locale].
  @action
  Future<void> updateLocale(Locale locale) async {
    localeRepository.setLocale(locale);
  }
}
