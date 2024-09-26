import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CategoryCard extends StatelessWidget {
  final IconModel icon;
  final String title;
  final Color backgroundColor;
  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final TextTheme textTheme = themeData.textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: 16.r,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topCenter,
        children: [
          Positioned(
              top: 16,
              left: 16,
              child: Text(
                title,
                style:
                    textTheme.titleLarge!.copyWith(color: AppColors.blackColor),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: IconWidget(model: icon),
          )),
        ],
      ),
    );
  }
}
