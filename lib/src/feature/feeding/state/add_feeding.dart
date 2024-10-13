import 'dart:developer';

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

  @observable
  bool confirmFeedingTimer = false;

  @observable
  bool isFeedingCanceled = false;
  
  @action
  changeStatusOfRightSide(){
    confirmFeedingTimer = false;
    isRightSideStart = !isRightSideStart;
    isLeftSideStart = false;
  }

  @action
  changeStatusOfLeftSide(){
    confirmFeedingTimer = false;
    isLeftSideStart = !isLeftSideStart;
    isRightSideStart = false;
  }

  @action
  confirmButtonPressed () {
    isRightSideStart = false;
    isLeftSideStart = false;
    confirmFeedingTimer = true;
  }

  @action
  goBackAndContinue(){
    confirmFeedingTimer = false;
    isFeedingCanceled = false;
  }

  @action
  cancelFeeding(){
    isRightSideStart = false;
    isLeftSideStart = false;
    isFeedingCanceled = true;
  }

  @action
  cancelFeedingClose(){
    isFeedingCanceled = false;
  }


  
}