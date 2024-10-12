import 'detail_time_of_leading.dart';

class HistoryOfFeeding {
  final String firstColumnText;
  final String secondColumnText;
  final String thirdColumnText;
  final String? fourthColumnText;
  List<DetailTimeOfLeading> detailColumnText;

  HistoryOfFeeding({
    required this.firstColumnText,
    required this.secondColumnText,
    required this.thirdColumnText,
    required this.detailColumnText,
    this.fourthColumnText,
  });
}