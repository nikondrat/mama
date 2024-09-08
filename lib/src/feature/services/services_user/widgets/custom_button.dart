import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.purpleLighterBackgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AutoSizeText(
              text,
              style: textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
