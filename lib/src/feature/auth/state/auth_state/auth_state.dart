

import 'dart:developer';

import 'package:mama/src/core/core.dart';
import 'package:mobx/mobx.dart';

part 'auth_state.g.dart';

class AuthState = AuthStateBase with _$AuthState;
abstract class AuthStateBase with Store{
  @observable
  var state = AuthStateAction.login;

  @action
  Future<void> confirmPhone(String phone) async {
    state = AuthStateAction.progress;
    await Future.delayed(Duration(seconds: 2));
    if(phone == "+7 996 997-06-24"){
      state = AuthStateAction.sendCode;
    }else{
      state = AuthStateAction.errorPhone;
    }
  }

  @action
  void onChangeTextField(String value){
    if(value.length == 13){
      state = AuthStateAction.enableConfirmButton;
    }else{
      state = AuthStateAction.disableConfirmButton;
    }
  }

  @action
  Future<void> checkCode(String code) async {
    state = AuthStateAction.progress;
    await Future.delayed(Duration(seconds: 2));
    if(code == "1234"){
      state = AuthStateAction.correctCode;
    }else{
      state = AuthStateAction.errorCode;
    }
  }

  @action
  void onCodeTextFieldChange(String value){
    if(value.length == 4){
      state = AuthStateAction.enableConfirmButton;
    }else{
      state = AuthStateAction.disableConfirmButton;
    }
  }

}

enum AuthStateAction{
  progress,
  login,
  sendCode,
  errorCode,
  errorPhone,
  correctCode,
  enableConfirmButton,
  disableConfirmButton
}