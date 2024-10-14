
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'add_manually.g.dart';

class AddManually extends _AddManually with _$AddManually {
  AddManually();
}

abstract class _AddManually with Store {
  final FormBuilder formBuilder = FormBuilder();

  late final FormGroup formGroup = formBuilder.group({
    'left': [''],
    'right': [''],
  });

  AbstractControl get left => formGroup.control('left');

  AbstractControl get right => formGroup.control('right');

  void dispose() {
    formGroup.dispose();
  }

}