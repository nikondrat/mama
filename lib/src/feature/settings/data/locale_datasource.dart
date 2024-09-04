import 'dart:ui';

import 'package:template/src/core/utils/preferences_dao.dart';

/// [LocaleDataSource] is an entry point to the locale data layer.
///
/// This is used to set and get locale.
abstract interface class LocaleDataSource {
  /// Set locale
  Future<void> setLocale(Locale locale);

  /// Get current locale from cache
  Future<Locale?> getLocale();
}

final class LocaleDataSourceLocal extends PreferencesDao
    implements LocaleDataSource {
  const LocaleDataSourceLocal({required super.sharedPreferences});

  PreferencesEntry<String> get _locale => stringEntry('settings.locale');

  @override
  Future<void> setLocale(Locale locale) async {
    await _locale.set(locale.languageCode);
  }

  @override
  Future<Locale?> getLocale() async {
    final languageCode = _locale.read();

    if (languageCode == null) return null;

    return Locale.fromSubtags(languageCode: languageCode);
  }
}
