import 'dart:async';
import 'package:mobx/mobx.dart';

part 'stop_watch_state.g.dart';

class StopwatchStore extends _StopwatchStore with _$StopwatchStore {
  StopwatchStore() {
    startTimer();
  }
}

abstract class _StopwatchStore with Store {
  @observable
  bool isStopped = false;

  @computed
  bool get isRunning => !isStopped;

  @observable
  Duration countdownTime = Duration.zero;

  @observable
  String countdownTimeString = '00:00';

  Timer? _timer;

  @action
  void startTimer() {
    isStopped = false;
    countdownTime = const Duration(minutes: 2);
    countdownTimeString = formatCountdownTime(countdownTime);

    _timer?.cancel();

    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (countdownTime > Duration.zero) {
        updateCountDownTime();
      } else {
        stopTimer();
      }
    });
  }

  void updateCountDownTime() {
    countdownTime -= const Duration(seconds: 1);
    countdownTimeString = formatCountdownTime(countdownTime);
  }

  @action
  void resetTimer() {
    countdownTime = const Duration(minutes: 2);
    countdownTimeString = formatCountdownTime(countdownTime);
    stopTimer();
  }

  @action
  void stopTimer() {
    _timer?.cancel();
    _timer = null;
    isStopped = true;
  }

  String formatCountdownTime(Duration time) {
    final minutes = time.inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = time.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
