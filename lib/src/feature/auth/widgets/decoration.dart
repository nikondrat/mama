import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mama/src/data.dart';

class BodyDecoration extends StatelessWidget {
  final Widget child;
  final DecorationImage? backgroundImage;

  final List<Color>? gradientColors;
  const BodyDecoration({
    super.key,
    required this.child,
    this.backgroundImage,
    this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          image: backgroundImage,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: gradientColors ??
                [
                  AppColors.softPeach,
                  AppColors.whiteColor,
                ],
          ),
        ),
        child: child);
  }
}
