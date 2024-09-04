import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart' show ThemeMode, Color;
import 'package:template/src/core/utils/preferences_dao.dart';
import 'package:template/src/feature/app/model/app_theme.dart';

/// [ThemeDataSource] is a data source that provides theme data.
///
/// This is used to set and get theme.
abstract interface class ThemeDataSource {
  /// Set theme
  Future<void> setTheme(AppThemeStore theme);

  /// Get current theme from cache
  Future<AppThemeStore?> getTheme();
}

final class ThemeDataSourceLocal extends PreferencesDao
    implements ThemeDataSource {
  const ThemeDataSourceLocal({
    required super.sharedPreferences,
    required this.codec,
  });

  /// Codec for [ThemeMode]
  final Codec<ThemeMode, String> codec;

  PreferencesEntry<int> get _seedColor => intEntry('theme.seed_color');

  PreferencesEntry<String> get _themeMode => stringEntry('theme.mode');

  @override
  Future<void> setTheme(AppThemeStore theme) async {
    await _seedColor.setIfNullRemove(theme.seed.value);
    await _themeMode.setIfNullRemove(codec.encode(theme.mode));
  }

  @override
  Future<AppThemeStore?> getTheme() async {
    final seedColor = _seedColor.read();

    final type = _themeMode.read();

    if (type == null || seedColor == null) return null;

    return AppThemeStore(seed: Color(seedColor), mode: codec.decode(type));
  }
}
