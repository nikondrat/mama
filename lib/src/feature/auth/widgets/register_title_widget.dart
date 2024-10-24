import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class TitleWidget extends StatelessWidget {
  final String text;
  const TitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Text(
      text,
      textAlign: TextAlign.center,
      style: textTheme.headlineSmall!.copyWith(
        color: AppColors.primaryColor,
        fontSize: 20,
      ),
    );
  }
}
