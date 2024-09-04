import 'package:template/src/feature/app/model/app_theme.dart';
import 'package:template/src/feature/settings/data/theme_datasource.dart';

/// Theme repository that persists and retrieves theme information
abstract interface class ThemeRepository {
  /// Get theme
  Future<AppThemeStore?> getTheme();

  /// Set theme
  Future<void> setTheme(AppThemeStore theme);
}

/// Theme repository implementation
final class ThemeRepositoryImpl implements ThemeRepository {
  /// Create theme repository
  const ThemeRepositoryImpl({required ThemeDataSource themeDataSource})
      : _themeDataSource = themeDataSource;

  final ThemeDataSource _themeDataSource;

  @override
  Future<AppThemeStore?> getTheme() => _themeDataSource.getTheme();

  @override
  Future<void> setTheme(AppThemeStore theme) =>
      _themeDataSource.setTheme(theme);
}
