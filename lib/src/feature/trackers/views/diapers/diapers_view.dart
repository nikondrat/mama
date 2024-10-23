import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class DiapersView extends StatelessWidget {
  const DiapersView({
    super.key,
    this.isTrue = false,
  });

  final bool? isTrue;

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Scaffold(
      backgroundColor: AppColors.diapersBackroundColor,
      appBar: CustomAppBar(title: t.trackers.diapers),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.whiteColor,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView(
                  children: [
                    ToKnowMoreContainer(
                      title1: t.trackers.knowMoreOne.title,
                      title2: t.trackers.knowMoreTwo.title,
                    ),
                    20.h,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.arrow_back_ios,
                          color: AppColors.primaryColor,
                        ),
                        20.w,
                        Column(
                          children: [
                            Text(
                              '11 сентября - 17 сентября',
                              style: AppTextStyles.f14w400,
                            ),
                            Text(
                              t.trackers.diaperforday,
                              style: AppTextStyles.f10w400,
                            ),
                          ],
                        ),
                        20.w,
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.primaryColor,
                        ),
                      ],
                    ),
                    10.h,
                    // Основное содержимое календаря

                    BuildDaySection('17\nсентября', [
                      BuilldGridItem(
                        '09:56',
                        t.trackers.wet.wet,
                        t.trackers.wet.many,
                        AppColors.purpleLighterBackgroundColor,
                        AppColors.primaryColor,
                      ),
                      BuilldGridItem(
                        '11:25',
                        t.trackers.dirty.dirty,
                        t.trackers.dirty.solid,
                        AppColors.yellowBackgroundColor,
                        AppColors.orangeTextColor,
                      ),
                      BuilldGridItem(
                        '13:30',
                        t.trackers.mixed.mixed,
                        t.trackers.mixed.soft,
                        AppColors.greenLighterBackgroundColor,
                        AppColors.greenTextColor,
                      ),
                      BuilldGridItem(
                        '15:00',
                        t.trackers.wet.wet,
                        t.trackers.wet.average,
                        AppColors.purpleLighterBackgroundColor,
                        AppColors.primaryColor,
                      ),
                      BuilldGridItem(
                        '18:00',
                        t.trackers.mixed.mixed,
                        t.trackers.mixed.soft,
                        AppColors.greenLighterBackgroundColor,
                        AppColors.greenTextColor,
                      ),
                      BuilldGridItem(
                        '20:00',
                        t.trackers.wet.wet,
                        t.trackers.wet.littleBit,
                        AppColors.purpleLighterBackgroundColor,
                        AppColors.primaryColor,
                      ),
                    ]),
                    const SizedBox(height: 70),
                  ],
                ),
              ),
            ),
          ),

          /// #bottom buttons
          ColoredBox(
            color: AppColors.whiteColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                top: 8,
                bottom: phonePadding.bottom + 16,
              ),
              child: Row(
                children: [
                  /// #find out more button
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.findOutMore.title,
                      onTap: () {},
                      icon: IconModel(
                        iconPath: Assets.icons.icGraduationCapFilled,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      type: CustomButtonType.outline,
                      textStyle: textTheme.titleMedium!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  8.w,

                  /// #pdf button
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.pdf.title,
                      onTap: () {},
                      icon: IconModel(
                        iconPath: Assets.icons.icArrowDownFilled,
                      ),
                      type: CustomButtonType.outline,
                    ),
                  ),
                  8.w,

                  /// #add temperature button
                  Expanded(
                    child: CustomButton(
                      title: t.trackers.add.title,
                      onTap: () {
                        // context.pushNamed(AppViews.addDiaper);
                      },
                      icon: IconModel(
                        iconPath: Assets.icons.icThermometer,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
