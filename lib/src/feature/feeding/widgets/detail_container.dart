import 'package:flutter/material.dart';
import '../../../data.dart';

class DetailContainer extends StatelessWidget {
  final String title;
  final String text;
  final String detail;
  final bool filled;

  const DetailContainer(
      {super.key,
        required this.title,
        required this.text,
        required this.detail,
        required this.filled});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
          border: Border.all(
              color: filled
                  ? Colors.transparent
                  : AppColors.purpleLighterBackgroundColor),
          color: filled ? AppColors.purpleLighterBackgroundColor : null,
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.labelLarge
                  ?.copyWith(color: AppColors.greyBrighterColor),
            ),
            Text(
              text,
              style: textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
            Text(
              detail,
              style: textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyBrighterColor),
            ),
          ],
        ),
      ),
    );
  }
}
