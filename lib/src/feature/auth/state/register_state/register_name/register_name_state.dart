
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_name_state.g.dart';

class RegisterNameState extends _RegisterNameState with _$RegisterNameState {
  RegisterNameState();
}

abstract class _RegisterNameState with Store {
  FormGroup formGroup = FormGroup({
    'name': FormControl<String>(
        validators: [Validators.required, Validators.minLength(1)]),
    'surname': FormControl<String>(
        validators: [Validators.required, Validators.minLength(1)])
  });

  AbstractControl get name => formGroup.control('name');
  AbstractControl get surname => formGroup.control('surname');

  void dispose() {
    formGroup.dispose();
  }
}