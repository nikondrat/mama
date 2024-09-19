

import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_baby_name.g.dart';

class RegisterBabyName extends _RegisterBabyName with _$RegisterBabyName {
  RegisterBabyName();
}

abstract class _RegisterBabyName with Store {
  FormGroup formGroup = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(1)]),
  });

  AbstractControl get name => formGroup.control('name');

  void dispose() {
    formGroup.dispose();
  }

  @observable
  bool isBoy = false;

  @action
  void setGender(int value) {
    isBoy = value == 0 ? false : true;
  }

}