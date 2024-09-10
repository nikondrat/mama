import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'auth_view.g.dart';

class AuthViewStore extends _AuthViewStore with _$AuthViewStore {
  AuthViewStore();
}

abstract class _AuthViewStore with Store {
  FormGroup formGroup = FormGroup({});

  
}
