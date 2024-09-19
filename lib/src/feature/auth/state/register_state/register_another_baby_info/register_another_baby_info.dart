
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'register_another_baby_info.g.dart';

class RegisterAnotherBabyInfo extends _RegisterAnotherBabyInfo with _$RegisterAnotherBabyInfo {
  RegisterAnotherBabyInfo();
}

abstract class _RegisterAnotherBabyInfo with Store {
  FormGroup formGroup = FormGroup({
    'weight': FormControl<double>(),
    'height': FormControl<double>(),
    'headCircumference': FormControl<double>(),
  });

  AbstractControl get weight => formGroup.control('weight');
  AbstractControl get height => formGroup.control('height');
  AbstractControl get headCircumference => formGroup.control('headCircumference');

  void dispose() {
    formGroup.dispose();
  }

}