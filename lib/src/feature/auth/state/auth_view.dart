import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'auth_view.g.dart';

class AuthViewStore extends _AuthViewStore with _$AuthViewStore {
  AuthViewStore();
}

abstract class _AuthViewStore with Store {
  final FormBuilder formBuilder = FormBuilder();

  late final FormGroup formGroup = formBuilder.group({
    'phone': ['', Validators.required, Validators.minLength(13)],
    'name': ['', Validators.required],
    'surname': ['', Validators.required],
    'childName': ['', Validators.required],
    'child': fb.group({
      'weight': ['', Validators.required],
      'height': ['', Validators.required],
      'headCircumference': ['', Validators.required],
    })
  });

  // FormGroup formGroup = FormGroup({
  //   'phone': FormControl<String>(
  //       validators: [Validators.required, Validators.minLength(13)])
  // });

  AbstractControl get phone => formGroup.control('phone');

  AbstractControl get name => formGroup.control('name');

  AbstractControl get surname => formGroup.control('surname');

  AbstractControl get childName => formGroup.control('childName');

  FormGroup get childData => formGroup.control('child') as FormGroup;

  AbstractControl get weight => childData.control('weight');

  AbstractControl get height => childData.control('height');

  AbstractControl get headCircumference =>
      childData.control('headCircumference');

  ChildModel child =
      ChildModel(firstName: '', secondName: '', birthDate: DateTime.now());

  void dispose() {
    formGroup.dispose();
  }

  @observable
  bool isAgree = false;

  @action
  void setAgree(bool value) {
    isAgree = value;
  }
}
