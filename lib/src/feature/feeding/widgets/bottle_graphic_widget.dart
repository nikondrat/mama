

import 'package:flutter/material.dart';
import 'package:mama/src/feature/feeding/data/data.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

class BottleGraphicWidget extends StatelessWidget {
  const BottleGraphicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GraphicWidget(
        pumpingData: listOfBottleData(),
        firstPartText: 'Грудь',
        secondPartText: 'Смесь',
        maximum: 500,
        minimum: 0,
        interval: 100,
      ),
    );
  }
}
