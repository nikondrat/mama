import 'dart:async';

import 'package:mobx/mobx.dart';

part 'stop_watch_state.g.dart';

class StopWatchState = StopWatchStateBase with _$StopWatchState;

abstract class StopWatchStateBase with Store {
  @observable
  late Duration countdownTime;

  @observable
  late String countdownTimeString;

  late Timer timer;

  @action
  startTimer() {
    countdownTime = const Duration(minutes: 2);
    countdownTimeString = formatCountdownTime(countdownTime);

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdownTime > Duration.zero) {
        updateCountDownTime();
      } else {
        timer.cancel();
      }
    });
  }

  void updateCountDownTime() {
    countdownTime = countdownTime - const Duration(seconds: 1);
    countdownTimeString = formatCountdownTime(countdownTime);
  }

  @action
  void resetTimer() {
    countdownTime = Duration(minutes: 2);
    countdownTimeString = formatCountdownTime(countdownTime);

    if (timer.isActive) {
      timer.cancel();
    }

    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdownTime > Duration.zero) {
        updateCountDownTime();
      } else {
        timer.cancel();
      }
    });
  }

  @action
  stopTimer() {
    timer.cancel();
  }

  String formatCountdownTime(Duration time) {
    return '${time.inMinutes.remainder(60).toString().padLeft(1, '0')}:${(time.inSeconds.remainder(60)).toString().padLeft(2, '0')}';
  }
}
