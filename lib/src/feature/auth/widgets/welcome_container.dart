
import 'package:flutter/material.dart';

import '../../../core/core.dart';
import '../data/entity/content.dart';

class WelcomeContainer extends StatelessWidget {
  final Content content;

  const WelcomeContainer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.06,
        ),
        Image.asset(content.assetImage),
        Text(content.title,
            style: textTheme.labelLarge
                ?.copyWith(
                fontSize: 24,
                color: AppColors.primaryColor)),
        15.h,
        Text(
          content.text,
          style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}