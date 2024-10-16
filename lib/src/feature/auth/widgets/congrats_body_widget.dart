import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CongratsBodyWidget extends StatelessWidget {
  const CongratsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      children: [
        Text(
          t.register.hurrah,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 64,
              color: AppColors.primaryColor),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                '${t.register.youWithUs} 🙂',
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge
                    ?.copyWith(color: AppColors.primaryColor),
              ),
              8.h,
              Text(
                t.register.letsFillAcc,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge
                    ?.copyWith(color: AppColors.primaryColor),
              )
            ],
          ),
        )
      ],
    );
  }
}
