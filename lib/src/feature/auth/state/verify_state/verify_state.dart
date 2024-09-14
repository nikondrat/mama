
import 'dart:async';
import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'verify_state.g.dart';

class VerifyState extends _VerifyState with _$VerifyState {
  VerifyState();
}

abstract class _VerifyState with Store {
  @observable
  bool isValid = false;

  @action
  update(String value){
    if(value.length == 4){
      log('len == 4');
      isValid = true;
      log('code: $value');
    }else{
      isValid = false;
    }
  }

}