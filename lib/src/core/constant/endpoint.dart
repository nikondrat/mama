class Endpoint {
  static const String auth = 'auth';

  String get accessToken => '$auth/access-token';

  String get logout => '$auth/log-out';

  String get login => '$auth/sign-in';

  String get register => '$auth/sign-up';

  String get sendCode => '$auth/send-phone-code';

  static const String geo = 'geo';

  String get cities => '$geo/city';

  String get countries => '$geo/country';

  static const String user = 'user';

  String get userData => '$user/me';

  static const String account = 'account';

  String get accountAvatar => '$account/avatar';

  static const String child = 'child';

  String get childAvatar => '$child/avatar';

  static const String payment = 'payment';

  String get promocode => '$payment/promocode';

  static const String consultation = 'consultation';

  String get userConsultations => '$consultation/user';

  static const String article = 'article';

  String get articles => '$article/all';
}
