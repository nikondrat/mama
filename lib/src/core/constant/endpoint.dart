class Endpoint {
  static const String auth = 'auth';

  String get login => '$auth/sign-in';

  String get register => '$auth/sign-up';

  String get sendCode => '$auth/send-phone-code';

  static const String geo = 'geo';

  String get cities => '$geo/city';

  String get countries => '$geo/country';

  static const String user = 'user';

  String get userMe => '$user/me';

  String get changeUserInfo => '/';

}
