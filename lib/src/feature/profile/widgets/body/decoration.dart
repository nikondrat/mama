import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BodyItemDecoration extends StatelessWidget {
  final Widget child;
  const BodyItemDecoration({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: 16.r,
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
