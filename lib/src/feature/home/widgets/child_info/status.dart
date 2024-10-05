import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ChildStatus extends StatelessWidget {
  const ChildStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.whiteColor,
                AppColors.yellowColor,
              ],
            ).createShader(bounds);
          },
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.yellowColor,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0).copyWith(top: 24),
              child: Text(
                t.home.soonSixMonths.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),

        /// #icon
        const Positioned(
          top: -40,
          child: Text(
            '🥳',
            style: TextStyle(fontSize: 50),
          ),
        ),
      ],
    );
  }
}
