import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CardWithoutMargin extends StatelessWidget {
  final Widget child;
  const CardWithoutMargin({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        shadowColor: AppColors.skyBlue,
        elevation: 1,
        color: AppColors.whiteColor,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8.0),
          child: child,
        ),
      ),
    );
  }
}
