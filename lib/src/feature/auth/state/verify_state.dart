import 'package:flutter/foundation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'verify_state.g.dart';

class VerifyStore extends _VerifyStore with _$VerifyStore {
  VerifyStore({
    required super.restClient,
    required super.formattedPhoneNumber,
  });
}

abstract class _VerifyStore with Store {
  final RestClient restClient;
  final String formattedPhoneNumber;

  _VerifyStore({
    required this.restClient,
    required this.formattedPhoneNumber,
  });

  String get phoneNumber =>
      '+7${formattedPhoneNumber.replaceAll(' ', '').replaceAll('-', '')}';

  @computed
  bool get isValid => error == null;

  @observable
  String? error;

  @action
  void sendCode() {
    restClient.post(
      Endpoint().sendCode,
      body: {
        'phone': phoneNumber,
        'is_sms': !kDebugMode,
      },
    );
  }

  @action
  void update(String value) {
    // if (value.length == 4) {
    //   logger.info('len $value');
    //   restClient
    //       .patch(Endpoint().login, body: {
    //         'code': value,
    //         'phone': phoneNumber,
    //         'fcm_token': '' // TODO: add fcm token
    //       })
    //       .then((v) {})
    //       .catchError((e) {
    //         error = t.auth.invalidPassword;
    //       });
    // }
    // else {
    //   error = null;
    // }
  }
}
