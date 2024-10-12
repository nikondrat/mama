import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ConsultationBadge extends StatelessWidget {
  final String title;
  const ConsultationBadge({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SizedBox(
      height: 18,
      child: FittedBox(
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: 8.r,
            color: AppColors.purpleLighterBackgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
            child: AutoSizeText(
              title,
              maxLines: 1,
              style:
                  textTheme.labelSmall!.copyWith(color: AppColors.primaryColor),
            ),
          ),
        ),
      ),
    );
  }
}
