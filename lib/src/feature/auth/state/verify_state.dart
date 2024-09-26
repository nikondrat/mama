import 'package:flutter/foundation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'verify_state.g.dart';

class VerifyStore extends _VerifyStore with _$VerifyStore {
  VerifyStore({
    required super.restClient,
  });
}

abstract class _VerifyStore with Store {
  final RestClient restClient;

  _VerifyStore({
    required this.restClient,
  });

  @computed
  bool get isValid => error == null;

  @observable
  String? error;

  @action
  void sendCode(String phoneNumber) {
    restClient.post(Endpoint().sendCode, body: {
      'phone': phoneNumber,
      'is_sms': !kDebugMode,
    });
  }

  @action
  void update(String value) {
    if (value.length == 4) {
      logger.info('len $value');
      restClient.patch(Endpoint().login, body: {
        'code': value,
        'phone': '',
      });
      // error = t.auth.invalidPassword;
    } else {
      error = null;
    }
  }
}
