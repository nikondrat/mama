import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CategoryCard extends StatelessWidget {
  final IconModel icon;
  final String title;
  final Color backgroundColor;
  final Function() onTap;
  const CategoryCard({
    super.key,
    required this.icon,
    required this.title,
    required this.backgroundColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    final TextTheme textTheme = themeData.textTheme;

    return SizedBox(
      height: 200,
      child: GestureDetector(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: 16.r,
          ),
          child: Column(
            // clipBehavior: Clip.none,
            // alignment: Alignment.topCenter,
            children: [
              // Positioned(
              //     top: 16,
              //     left: 16,
              //     child:
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, left: 16),
                  child: Text(
                    title,
                    style: textTheme.titleLarge!
                        .copyWith(color: AppColors.blackColor),
                    // )
                  ),
                ),
              ),
              Expanded(child: IconWidget(model: icon)),
            ],
          ),
        ),
      ),
    );
  }
}
