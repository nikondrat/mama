

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
  Future<void> confirmPhone({required String phone}) async {
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
  Future<void> checkCode({required String code}) async {
    state = RegisterStateAction.progress;
    await Future.delayed(Duration(seconds: 2));
    if(code == "1234"){
      state = RegisterStateAction.correctCode;
    }else{
      state = RegisterStateAction.errorCode;
    }
  }

  @action
  void onCodeTextFieldChange({required String value}){
    if(value.length == 4){
      state = RegisterStateAction.enableConfirmButton;
    }else{
      state = RegisterStateAction.disableConfirmButton;
    }
  }

  @action
  Future<void> fillNameAndSurname( String name, String surname) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "name" : name,
      "surname" : surname
    });
    log('saved data: $data');
    state = RegisterStateAction.savedSuccess;
  }

  @action
  Future<void> fillBabyName({required String name, required int gender}) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "babyName": name,
      "gender" : gender
    });
    log('saved data: $data');
    state = RegisterStateAction.savedSuccess;
  }

  @action
  Future<void> fillBabyDetailInfo({
    required String weight,
    required String height,
    required String headCircumference}) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "weight": weight,
      "height" : height,
      "headCircumference" : headCircumference
    });
    log('saved data: $data');
    state = RegisterStateAction.savedSuccess;
  }

  @action
  Future<void> fillChildBirthInfo({
    required int childBirth,
    required bool wasComplications }) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "childBirth": childBirth,
      "wasComplications" : wasComplications
    });
    log('saved data: $data');
    state = RegisterStateAction.savedSuccessChildBirth;
  }

  @action
  Future<void> fillCity({
    required String city}) async {
    state = RegisterStateAction.progress;
    ///имитация сохранение данных в бд
    await Future.delayed(Duration(seconds: 1));
    data.addAll({
      "city": city
    });
    log('saved data: $data');
    state = RegisterStateAction.savedSuccessChildBirth;
  }

  @action
  void skip() {
    state = RegisterStateAction.none;
  }


}

enum RegisterStateAction{
  none,
  progress,
  register,
  sendCode,
  errorCode,
  errorPhone,
  correctCode,
  enableConfirmButton,
  disableConfirmButton,
  savedSuccess,
  savedSuccessChildBirth
}