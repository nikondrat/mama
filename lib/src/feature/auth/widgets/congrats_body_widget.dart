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
          style: textTheme.headlineSmall!.copyWith(
            color: AppColors.primaryColor,
            fontSize: 64,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(
                '${t.register.youWithUs} 🙂',
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
              8.h,
              Text(
                t.register.letsFillAcc,
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
