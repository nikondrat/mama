

import 'package:mobx/mobx.dart';

part 'register_childbirth_info.g.dart';

class RegisterChildbirthInfo extends _RegisterChildbirthInfo with _$RegisterChildbirthInfo {
  RegisterChildbirthInfo();
}

abstract class _RegisterChildbirthInfo with Store {

  @observable
  var wereComplications = false;

  @observable
  var birthType = false;

  @action
  setComplications(bool value){
    wereComplications = value;
  }

  @action
  setBirthType(bool value) {
    birthType = value;
  }


}