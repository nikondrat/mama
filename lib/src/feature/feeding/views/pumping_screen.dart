import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/repository/history_repository.dart';
import 'package:mama/src/feature/feeding/widgets/table_history.dart';
import 'package:mama/src/feature/feeding/widgets/pumping_graphic_widget.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

import '../../../core/core.dart';

class PumpingScreen extends StatelessWidget {
  const PumpingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final listOfData = historyOfPumping;

    return FeedingBody(
      children: [
        const PumpingGraphicWidget(),
        TableHistory(
          listOfData: listOfData,
          firstColumnName: t.feeding.endTimeOfPumping,
          secondColumnName: t.feeding.pumpingLeftSide,
          thirdColumnName: t.feeding.pumpingRightSide,
          fourthColumnName: t.feeding.totalMl,
          showTitle: true,
        ),
      ],
    );
  }
}
