import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'auth_view.g.dart';

class AuthViewStore extends _AuthViewStore with _$AuthViewStore {
  AuthViewStore({
    required super.restClient,
  });
}

abstract class _AuthViewStore with Store {
  _AuthViewStore({
    required this.restClient,
  });
  final RestClient restClient;

  FormGroup formGroup = FormGroup({
    'phone': FormControl<String>(
        validators: [Validators.required, Validators.minLength(13)])
  });

  AbstractControl get phone => formGroup.control('phone');

  void dispose() {
    formGroup.dispose();
  }

  @observable
  bool isAgree = false;

  @action
  void setAgree(bool value) {
    isAgree = value;
  }

  @action
  void sendCode() {
    if (formGroup.valid) {
      restClient.post(Endpoint().sendCode, body: {
        'phone': phone.value,
      });
    } else {
      formGroup.markAllAsTouched();
    }
  }
}
