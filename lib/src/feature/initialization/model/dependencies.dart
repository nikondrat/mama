import 'package:shared_preferences/shared_preferences.dart';

import 'package:template/src/data.dart';

/// Dependencies container
base class Dependencies {
  const Dependencies({
    required this.sharedPreferences,
    required this.settingsStore,
    required this.errorTrackingManager,
  });

  /// [SharedPreferences] instance, used to store Key-Value pairs.
  final SharedPreferences sharedPreferences;

  /// [SettingsStore] instance, used to manage theme and locale.
  final SettingsStore settingsStore;

  /// [ErrorTrackingManager] instance, used to report errors.
  final ErrorTrackingManager errorTrackingManager;
}

/// Result of initialization
final class InitializationResult {
  const InitializationResult({
    required this.dependencies,
    required this.msSpent,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// The number of milliseconds spent
  final int msSpent;

  @override
  String toString() => '$InitializationResult('
      'dependencies: $dependencies, '
      'msSpent: $msSpent'
      ')';
}
