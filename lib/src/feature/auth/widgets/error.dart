import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mama/src/data.dart';

class InputErrorWidget extends StatelessWidget {
  final String? error;
  const InputErrorWidget({
    super.key,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final ColorScheme colorScheme = themeData.colorScheme;

    if (error != null) {
      return DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: 14.r,
          color: AppColors.redColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 4,
          ),
          child: AutoSizeText(
            error!,
            style: textTheme.bodySmall!
                .copyWith(fontSize: 6, color: colorScheme.onPrimary),
          ),
        ),
      );
    }

    return SizedBox.shrink();
  }
}