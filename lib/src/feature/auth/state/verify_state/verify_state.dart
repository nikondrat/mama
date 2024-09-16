import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'verify_state.g.dart';

class VerifyState extends _VerifyState with _$VerifyState {
  VerifyState();
}

abstract class _VerifyState with Store {
  @computed
  bool get isValid => error == null;

  @observable
  String? error;

  @action
  update(String value) {
    if (value.length == 4) {
      logger.info('len $value');
      error = t.auth.invalidPassword;
    } else {
      error = null;
    }
  }
}
