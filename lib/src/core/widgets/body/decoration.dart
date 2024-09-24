import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BodyItemDecoration extends StatelessWidget {
  final Widget child;
  final Border? backgroundBorder;
  const BodyItemDecoration({
    super.key,
    required this.child,
    this.backgroundBorder,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: 16.r,
        border: backgroundBorder,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 12,
        ),
        child: child,
      ),
    );
  }
}
