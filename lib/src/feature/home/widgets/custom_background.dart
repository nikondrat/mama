import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomBackground extends StatelessWidget {
  final double? height;
  final double padding;
  final Widget child;

  const CustomBackground({
    super.key,
    this.height,
    required this.padding,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              blurRadius: 1,
              offset: const Offset(0, 2),
              color: AppColors.deepBlue.withOpacity(0.1),
            ),
            BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 3),
              color: AppColors.skyBlue.withOpacity(0.15),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
