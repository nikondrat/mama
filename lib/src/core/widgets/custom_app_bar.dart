import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// #arrow left, back text
          CustomBackButton(),

          /// #sleep music text
          Text(
            t.services.sleepMusic.title,
            style: textTheme.titleLarge,
          ),

          /// #some space, placeholder(child image)
          const Row(
            children: [
              SizedBox(width: 16),

              /// #placeholder(child image)
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blackColor,
                ),
                child: SizedBox(
                  width: 40,
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
