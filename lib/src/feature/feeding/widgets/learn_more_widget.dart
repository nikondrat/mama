import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class LearnMoreWidget extends StatelessWidget {
  const LearnMoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColors.lightBlue),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.close,
                  color: AppColors.greyColor,
                ),
              ),
            ),
            AutoSizeText(
              '${t.feeding.learnMoreText}:',
              style: textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyBrighterColor),
            ),
            20.h,
            CustomButton(
              isSmall: false,
              type: CustomButtonType.outline,
              onTap: () {},
              icon: IconModel(iconPath: Assets.icons.icLearnMore),
              title: t.feeding.learnMoreBtn,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              textStyle: textTheme.titleLarge?.copyWith(fontSize: 10),
            ),
            16.h
          ],
        ),
      ),
    );
  }
}
