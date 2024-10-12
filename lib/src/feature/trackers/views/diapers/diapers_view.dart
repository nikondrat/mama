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
      appBar: const CustomAppBar(title: 'Подгузники'),
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
                              '6 подгузников в день в среднем',
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

                    buildDaySection('17\nсентября', [
                      buildGridItem(
                        '09:56',
                        'Мокрый',
                        'Много',
                        AppColors.purpleLighterBackgroundColor,
                        AppColors.primaryColor,
                      ),
                      buildGridItem(
                        '11:25',
                        'Грязный',
                        'Твердый',
                        AppColors.yellowBackgroundColor,
                        AppColors.orangeTextColor,
                      ),
                      buildGridItem(
                        '13:30',
                        'Смешанный',
                        'Мягкий',
                        AppColors.greenLighterBackgroundColor,
                        AppColors.greenTextColor,
                      ),
                      buildGridItem(
                        '15:00',
                        'Мокрый',
                        'Средне',
                        AppColors.purpleLighterBackgroundColor,
                        AppColors.primaryColor,
                      ),
                      buildGridItem(
                        '18:00',
                        'Смешанный',
                        'Мягкий',
                        AppColors.greenLighterBackgroundColor,
                        AppColors.greenTextColor,
                      ),
                      buildGridItem(
                        '20:00',
                        'Мокрый',
                        'Мало',
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
                        context.pushNamed(AppViews.addDiaper);
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

  // Метод для создания отдельного элемента календаря
  Widget buildGridItem(String time, String type, String description,
      Color color, Color textColor) {
    return Container(
      margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            time,
            style: AppTextStyles.f10w400,
          ),
          Text(
            type,
            style: AppTextStyles.f14w700.copyWith(color: textColor),
          ),
          Text(
            description,
            style: AppTextStyles.f10w400,
          ),
        ],
      ),
    );
  }

  // Метод для создания секции на день
  Widget buildDaySection(String date, List<Widget> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            date,
            style: AppTextStyles.f14w400,
          ),
          10.w,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: items,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
