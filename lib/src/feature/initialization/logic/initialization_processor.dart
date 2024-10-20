import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:intl/intl.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mama/src/data.dart';

final class InitializationProcessor {
  const InitializationProcessor(this.config);

  /// Application configuration
  final Config config;

  Future<Dependencies> _initDependencies() async {
    final sharedPreferences = await SharedPreferences.getInstance();

    final tokenStorage = Fresh.oAuth2(
        tokenStorage: TokenStorageImpl(),
        refreshToken: (token, client) async {
          return await client
              .get(
            '${const Config().apiUrl}${Endpoint().accessToken}',
            options: Options(
              headers: {'Refresh-Token': 'Bearer ${token?.refreshToken}'},
              followRedirects: true,
              contentType: 'application/json',
              responseType: ResponseType.json,
            ),
          )
              .then((v) {
            return OAuth2Token(
                accessToken: v.data['access_token'],
                refreshToken: v.data['refresh_token']);
          });
        });
    final restClient = await _initRestClient(tokenStorage);
    final errorTrackingManager = await _initErrorTrackingManager();
    final settingsStore = await _initSettingsStore(sharedPreferences);

    return Dependencies(
      sharedPreferences: sharedPreferences,
      settingsStore: settingsStore,
      errorTrackingManager: errorTrackingManager,
      restClient: restClient,
      tokenStorage: tokenStorage,
    );
  }

  Future<ErrorTrackingManager> _initErrorTrackingManager() async {
    final errorTrackingManager = SentryTrackingManager(
      logger,
      sentryDsn: config.sentryDsn,
      environment: config.environment.value,
    );

    if (config.enableSentry) {
      await errorTrackingManager.enableReporting();
    }

    return errorTrackingManager;
  }

  Future<SettingsStore> _initSettingsStore(SharedPreferences prefs) async {
    final localeRepository = LocaleRepositoryImpl(
      localeDataSource: LocaleDataSourceLocal(sharedPreferences: prefs),
    );

    final themeRepository = ThemeRepositoryImpl(
      themeDataSource: ThemeDataSourceLocal(
        sharedPreferences: prefs,
        codec: const ThemeModeCodec(),
      ),
    );

    final localeFuture = localeRepository.getLocale();
    final theme = await themeRepository.getTheme();
    final locale = await localeFuture;
    final settingsStore = SettingsStore(
      localeRepository: localeRepository,
      themeRepository: themeRepository,
      locale: locale ?? Locale(Intl.systemLocale),
      appTheme: theme ??
          AppThemeStore(mode: ThemeMode.light, seed: AppColors.primaryColor),
    );
    return settingsStore;
  }

  // Initializes the REST client with the provided FlutterSecureStorage.

  Future<RestClient> _initRestClient(Fresh storage) async {
    final dio = Dio(BaseOptions(
      baseUrl: const Config().apiUrl,
      followRedirects: true,
    ));
    dio.interceptors.add(PrettyDioLogger(requestBody: true));
    dio.interceptors.add(storage);

    return RestClientDio(baseUrl: config.apiUrl, dio: dio);
  }

  /// Initializes dependencies and returns the result of the initialization.
  ///
  /// This method may contain additional steps that need initialization
  /// before the application starts
  /// (for example, caching or enabling tracking manager)
  Future<InitializationResult> initialize() async {
    final stopwatch = Stopwatch()..start();

    logger.info('Initializing dependencies...');
    // initialize dependencies
    final dependencies = await _initDependencies();
    logger.info('Dependencies initialized');

    stopwatch.stop();
    final result = InitializationResult(
      dependencies: dependencies,
      msSpent: stopwatch.elapsedMilliseconds,
    );
    return result;
  }
}
