

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../core/core.dart';

class AddFeedingButtons extends StatelessWidget {
  const AddFeedingButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      children: [
        Text(
          t.feeding.addFeeding,
          style: textTheme.titleMedium?.copyWith(
              fontSize: 20, color: AppColors.greyBrighterColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${t.feeding.pressForAddFeedingTime.first}  ',
                style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyBrighterColor)),
            SvgPicture.asset(Assets.icons.icPlayerBtn),
            Text('  ${t.feeding.pressForAddFeedingTime.second}',
                style: textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyBrighterColor)),
          ],
        ),
        30.h,
        Row(
          children: [
            Expanded(
              flex: 1,
              child: CustomButton(
                type: CustomButtonType.outline,
                onTap: () {},
                icon: IconModel(
                    iconPath: Assets.icons.icLearnMore),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                textStyle: textTheme.titleLarge
                    ?.copyWith(fontSize: 10),
                title: t.feeding.learnMoreBtn,
              ),
            ),
            10.w,
            Expanded(
              flex: 2,
              child: CustomButton(
                backgroundColor:
                AppColors.purpleLighterBackgroundColor,
                onTap: () {
                  context.goNamed(AppViews.addManually);
                },
                title: t.feeding.addManually,
                icon: IconModel(
                    iconPath: Assets.icons.icCalendar),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 10, vertical: 12),
                textStyle: textTheme.bodyMedium
                    ?.copyWith(color: AppColors.primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
