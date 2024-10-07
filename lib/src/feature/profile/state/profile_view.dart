import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'profile_view.g.dart';

class ProfileViewStore extends _ProfileViewStore with _$ProfileViewStore {
  ProfileViewStore({
    required super.model,
  });
}

abstract class _ProfileViewStore with Store {
  final AccountModel model;

  _ProfileViewStore({required this.model});

  late final FormGroup formGroup;

  void init() {
    formGroup = FormGroup({
      'name': FormControl<String>(
        value: '${model.firstName} ${model.secondName}',
        validators: [Validators.required],
      ),
      'phone': FormControl<String>(
        value: model.phone,
        validators: [Validators.required],
      ),
      'email': FormControl<String>(
        value: model.email,
        validators: [Validators.required],
      ),
      'about': FormControl<String>(
        value: model.info,
        validators: [Validators.required],
      ),
    });
  }

  AbstractControl get name => formGroup.control('name');

  bool get isNameValid => name.valid;

  AbstractControl get phone => formGroup.control('phone');

  bool get isPhoneValid => phone.valid;

  AbstractControl get email => formGroup.control('email');

  bool get isEmailValid => email.valid;

  AbstractControl get about => formGroup.control('about');

  bool get isAboutValid => about.valid;

  void updateData() {
    if (isNameValid && name.value != '${model.firstName} ${model.secondName}') {
      final List<String> nameValue = (name.value as String).split(' ');

      model.setFirstName(nameValue[0]);
      model.setSecondName(nameValue[1]);
    }

    if (isPhoneValid && phone.value != model.phone) {
      model.setPhone(phone.value);
    }

    if (isEmailValid && email.value != model.email) {
      model.setEmail(email.value);
    }

    if (isAboutValid && about.value != model.info) {
      model.setInfo(about.value);
    }
  }

  void dispose() {
    formGroup.dispose();
  }
}
