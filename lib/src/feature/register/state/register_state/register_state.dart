

import 'dart:developer';

import 'package:mobx/mobx.dart';

part 'register_state.g.dart';

class RegisterState = RegisterStateBase with _$RegisterState;
abstract class RegisterStateBase with Store{
  @observable
  var state = RegisterStateAction.register;

  @observable
  Map<String, dynamic> data = {};

  @action
  Future<void> confirmPhone(String phone) async {
    state = RegisterStateAction.progress;
    await Future.delayed(Duration(seconds: 2));
    state = RegisterStateAction.sendCode;
  }

  @action
  void onChangeTextField(String value){
    if(value.length == 13){
      state = RegisterStateAction.enableConfirmButton;
    }else{
      state = RegisterStateAction.disableConfirmButton;
    }
  }

  @action
  Future<void> checkCode(String code) async {
    state = RegisterStateAction.progress;
    await Future.delayed(Duration(seconds: 2));
    if(code == "1234"){
      state = RegisterStateAction.correctCode;
    }else{
      state = RegisterStateAction.errorCode;
    }
  }

  @action
  void onCodeTextFieldChange(String value){
    if(value.length == 4){
      state = RegisterStateAction.enableConfirmButton;
    }else{
      state = RegisterStateAction.disableConfirmButton;
    }
  }

  @action
  void fillNameAndSurname({required String name, required String surname}) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "name" : name,
      "surname" : surname
    });
    log('saved data: $data');
  }

  @action
  void fillBabyName({required String name, required int gender}) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "babyName": name,
      "gender" : gender
    });
    log('saved data: $data');
  }


}

enum RegisterStateAction{
  progress,
  register,
  sendCode,
  errorCode,
  errorPhone,
  correctCode,
  enableConfirmButton,
  disableConfirmButton
}