import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BodyItemDecoration extends StatelessWidget {
  final Widget child;
  final Border? backgroundBorder;
  final bool? shadow;
  final EdgeInsets? padding;
  const BodyItemDecoration({
    super.key,
    required this.child,
    this.backgroundBorder,
    this.shadow = false,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: 16.r,
          border: backgroundBorder,
          boxShadow: shadow!
              ? [
                  BoxShadow(
                    color: AppColors.deepBlue.withOpacity(0.1), //New
                    blurRadius: 1.0,
                    offset: const Offset(
                      0,
                      2,
                    ),
                  ),
                  BoxShadow(
                    color: AppColors.skyBlue.withOpacity(0.15), //New
                    blurRadius: 8.0,
                    offset: const Offset(
                      0,
                      2,
                    ),
                  ),
                ]
              : null),
      child: Padding(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 12,
            ),
        child: child,
      ),
    );
  }
}
