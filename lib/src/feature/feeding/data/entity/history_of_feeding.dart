import 'detail_time_of_leading.dart';

class HistoryOfFeeding {
  final String dateTime;
  final String allLeftSideTime;
  final String allRightSideTime;
  final String allTime;
  List<DetailTimeOfLeading> detailTimeOfFeeding;

  HistoryOfFeeding({
    required this.dateTime,
    required this.allLeftSideTime,
    required this.allRightSideTime,
    required this.allTime,
    required this.detailTimeOfFeeding
  });
}