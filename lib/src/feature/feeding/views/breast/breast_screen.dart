import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/repository/history_repository.dart';
import '../../../../core/core.dart';
import '../../widgets/widget.dart';

class BreastScreen extends StatelessWidget {
  const BreastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfData = historyOfFeedings;

    return FeedingBody(
      children: [
        const AddFeedingWidget(),
        TableHistory(
          listOfData: listOfData,
          firstColumnName: t.feeding.feedingEndTime,
          secondColumnName: t.feeding.l,
          thirdColumnName: t.feeding.r,
          fourthColumnName: t.feeding.general,
          showTitle: true,
        )
      ],
    );
  }
}
