
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feeding/widgets/widget.dart';

class PumpingGraphicWidget extends StatelessWidget {
  const PumpingGraphicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          30.h,

          30.h,
          AddPumpingButton()
        ],
      )
    );
  }
}
