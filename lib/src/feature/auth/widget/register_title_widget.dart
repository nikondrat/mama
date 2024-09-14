
import 'package:flutter/material.dart';
import '../../../core/core.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Text(text,
      textAlign: TextAlign.center,
      style: textTheme.bodyLarge?.copyWith(
          color: AppColors.primaryColor
      ),);
  }
}