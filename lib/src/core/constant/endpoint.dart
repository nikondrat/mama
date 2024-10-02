class Endpoint {
  static const String auth = 'auth';

  String get accessToken => '$auth/access-token';

  String get login => '$auth/sign-in';

  String get register => '$auth/sign-up';

  String get sendCode => '$auth/send-phone-code';

  static const String geo = 'geo';

  String get cities => '$geo/city';

  String get countries => '$geo/country';

  static const String user = 'user';

  String get userData => '$user/me';

  static const String child = 'child';

  String get childAvatar => '$child/avatar';
}
