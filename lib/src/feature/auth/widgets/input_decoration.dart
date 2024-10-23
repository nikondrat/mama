
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class InputPlace extends StatelessWidget {
  final Widget child;
  const InputPlace({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: 24.r,
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                  color: AppColors.skyBlue.withOpacity(0.15),
                  blurRadius: 8,
                  spreadRadius: 0,
                  offset: const Offset(0, 3)),
              BoxShadow(
                  color: AppColors.deepBlue.withOpacity(0.10),
                  blurRadius: 1,
                  spreadRadius: 0,
                  offset: const Offset(0, 2)),
            ]),
        child: child);
  }
}