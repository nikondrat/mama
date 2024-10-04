import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class UnreadBox extends StatelessWidget {
  final int unread;
  const UnreadBox({super.key, required this.unread});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: 100.r,
        color: AppColors.primaryColor,
      ),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
      child: Text(
        unread.toString(),
        style: textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
