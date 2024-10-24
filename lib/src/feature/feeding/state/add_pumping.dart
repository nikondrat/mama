
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'add_pumping.g.dart';

class AddPumping extends _AddPumping with _$AddPumping {
  AddPumping();
}

abstract class _AddPumping with Store {
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