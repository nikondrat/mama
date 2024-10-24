import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/repository/feeding_repository.dart';
import 'package:mama/src/feature/feeding/data/repository/history_repository.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

import '../../../../core/core.dart';

class BottleScreen extends StatelessWidget {
  const BottleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfData = historyOfPumping;
    return FeedingBody(
      children: [
        GraphicWidget(listOfData: getBottleData(),
            topColumnText: "Грудь",
            bottomColumnText: 'Смесь',
            minimum: 0,
            maximum: 500,
            interval: 100),
        TableHistory(
          listOfData: listOfData,
          firstColumnName: t.feeding.feedingEndTime,
          secondColumnName: t.feeding.breastMl,
          thirdColumnName: t.feeding.bottleMl,
          fourthColumnName: t.feeding.totalMl,
          showTitle: true,
        ),
      ],
    );
  }
}
