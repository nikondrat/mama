import 'package:flutter/foundation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'verify_state.g.dart';

class VerifyStore extends _VerifyStore with _$VerifyStore {
  VerifyStore({
    required super.restClient,
    required super.formattedPhoneNumber,
    required super.tokenStorage,
  });
}

abstract class _VerifyStore with Store {
  final RestClient restClient;
  final String formattedPhoneNumber;
  final TokenStorage tokenStorage;

  _VerifyStore({
    required this.restClient,
    required this.formattedPhoneNumber,
    required this.tokenStorage,
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
  void update(
    String value,
    bool isLogin, {
    RegisterData? data,
  }) {
    if (value.length == 4) {
      logger.info('len $value');

      if (isLogin) {
        login(value);
      } else {
        assert(data != null);
        register(data: data!);
      }
    } else {
      error = null;
    }
  }

  void login(String code) {
    restClient.patch(Endpoint().login, body: {
      'code': code,
      'phone': phoneNumber,
      'fcm_token': '' // TODO: add fcm token
    }).then((v) {
      final String? refreshToken = v?['refresh_token'] as String?;

      if (refreshToken != null) {
        tokenStorage.saveTokenPair({'refresh': refreshToken});
      }
    }).catchError((e) {
      error = t.auth.invalidPassword;
    });
  }

  void register({
    required RegisterData data,
  }) {
    restClient.patch(Endpoint().register, body: {
      'account': data.user.toJson(),
      'child': data.child.toJson(),
      'user': {
        'city': data.city,
      }
    });
  }
}
