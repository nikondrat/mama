import 'package:mobx/mobx.dart';

part 'add_feeding.g.dart';

class AddFeeding extends _AddFeeding with _$AddFeeding {
  AddFeeding();
}

abstract class _AddFeeding with Store {
  
  @observable
  bool isRightSideStart = false;
  
  @observable
  bool isLeftSideStart = false;
  
  @action
  changeStatusOfRightSide(){
    isRightSideStart = !isRightSideStart;
    isLeftSideStart = false;
  }

  @action
  changeStatusOfLeftSide(){
    isLeftSideStart = !isLeftSideStart;
    isRightSideStart = false;
  }
  
}