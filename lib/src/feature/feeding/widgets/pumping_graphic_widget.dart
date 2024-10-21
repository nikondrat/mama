import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/data.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

class PumpingGraphicWidget extends StatelessWidget {
  const PumpingGraphicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GraphicWidget(
        pumpingData: listOfPumpingData(),
        firstPartText: 'Л',
        secondPartText: 'П',
        maximum: 150,
        minimum: 0,
        interval: 50,
      ),
    );
  }
}
