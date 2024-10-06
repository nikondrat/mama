import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/models/icon.dart';
import 'package:mama/src/feature/feeding/state/add_feeding.dart';
import 'package:mama/src/feature/feeding/widgets/play_button.dart';
import 'package:provider/provider.dart';

class AddFeedingWidget extends StatelessWidget {
  const AddFeedingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Provider(
      create: (context) => AddFeeding(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Observer(builder: (context) {
          final AddFeeding addFeeding = context.watch();
          var isStart =
              addFeeding.isRightSideStart || addFeeding.isLeftSideStart;
          return Column(
            children: [
              30.h,
              Align(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: PlayerButton(
                      side: t.feeding.left,
                      onTap: () {
                        addFeeding.changeStatusOfLeftSide();
                      },
                      isStart: addFeeding.isLeftSideStart,
                    )),
                    Expanded(
                        child: PlayerButton(
                      side: t.feeding.right,
                      onTap: () {
                        addFeeding.changeStatusOfRightSide();
                      },
                      isStart: addFeeding.isRightSideStart,
                    )),
                  ],
                ),
              ),
              30.h,
              isStart
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Текущее кормление',
                          style: textTheme.titleLarge
                              ?.copyWith(color: Colors.black, fontSize: 20),
                        ),
                        20.h,
                        Row(
                          children: [
                            Expanded(
                                child: DetailContainer(
                              title: 'Начало',
                              text: '16:35',
                              detail: 'Изменить',
                              filled: true,
                            )),
                            10.w,
                            Expanded(
                                child: DetailContainer(
                              title: 'Завершение',
                              text: '',
                              detail: 'Таймер запущен',
                              filled: false,
                            )),
                            10.w,
                            Expanded(
                                child: DetailContainer(
                              title: 'Всего',
                              text: '19м 58с',
                              detail: '',
                              filled: false,
                            )),
                          ],
                        ),
                        20.h,
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                type: CustomButtonType.outline,
                                onTap: () {},
                                icon: IconModel(
                                    iconPath: Assets.icons.icPencilFilled),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 12),
                                textStyle: textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                title: 'Заметка',
                              ),
                            ),
                            10.w,
                            Expanded(
                              flex: 2,
                              child: CustomButton(
                                backgroundColor:
                                    AppColors.greenLighterBackgroundColor,
                                onTap: () {},
                                title: 'Подтвердить',
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                textStyle: textTheme.titleMedium
                                    ?.copyWith(color: AppColors.greenTextColor),
                              ),
                            ),
                          ],
                        ),
                        10.h,
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                type: CustomButtonType.filled,
                                backgroundColor:
                                    AppColors.redLighterBackgroundColor,
                                onTap: () {},
                                icon: IconModel(iconPath: Assets.icons.icClose),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                textStyle: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.redColor),
                                title: 'Отменить',
                              ),
                            ),
                            10.w,
                            Expanded(
                              flex: 1,
                              child: CustomButton(
                                backgroundColor:
                                    AppColors.purpleLighterBackgroundColor,
                                onTap: () {},
                                title: 'Вручную',
                                icon: IconModel(
                                    iconPath: Assets.icons.icCalendar),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                textStyle: textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ],
                        ),
                        20.h,
                        Text(
                          'Счетчик будет добавлять время',
                          style: textTheme.labelLarge?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.greyBrighterColor),
                        ),
                        5.h,
                        Text('Подтвердите окончание кормления или отмените его',
                            textAlign: TextAlign.center,
                            style: textTheme.labelLarge?.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyBrighterColor)),
                      ],
                    )
                  : Column(
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
                                contentPadding: EdgeInsets.symmetric(
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
                                onTap: () {},
                                title: t.feeding.addManually,
                                icon: IconModel(
                                    iconPath: Assets.icons.icCalendar),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 12),
                                textStyle: textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.primaryColor),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
            ],
          );
        }),
      ),
    );
  }
}

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
