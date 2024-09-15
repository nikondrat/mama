
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import 'package:mama/src/core/core.dart';

import '../data/repository/history_repository.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final listOfData = historyOfFeedings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        20.h,
        Text(
          'История',
          style: textTheme.bodyLarge,
        ),
        15.h,
        Align(
          alignment: Alignment.topLeft,
          child: FlutterToggleButton(
            outerContainerMargin: 3,
            buttonWidth: 64,
            buttonHeight: 26,
            buttonColor: Colors.white,
            enableTextColor: AppColors.primaryColor,
            disableTextColor: AppColors.greyBrighterColor,
            disableTextFontWeight: FontWeight.w700,
            buttonTextFontSize: 17,
            borderRadius: 6,
            outerContainerColor: const Color(0xFFE1E6FF),
            onTap: (index) {},
            items: ['Новые', 'Старые'],
          ),
        ),
        15.h,
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RowTextTitle(text: 'Время окончания\nкормления'),
            RowTextTitle(text: 'Л'),
            RowTextTitle(text: 'П'),
            RowTextTitle(text: 'Общее'),
          ],
        ),
        10.h,
        SizedBox(
          height: listOfData.length * 140,
          child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final item = listOfData[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.dateTime,
                          style: textTheme.bodyMedium
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        Text(item.allLeftSideTime,
                            style: textTheme.displaySmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                        Text(
                          item.allRightSideTime,
                          style: textTheme.displaySmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                        Text(item.allTime,
                            style: textTheme.displaySmall
                                ?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    5.h,
                    SizedBox(
                      height: item.detailTimeOfFeeding.length * 25,
                      child: ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final detailInfo = item.detailTimeOfFeeding[index];
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(detailInfo.time,
                                    style: textTheme.displaySmall),
                                Text(detailInfo.leftTime,
                                    style: textTheme.displaySmall),
                                Text(detailInfo.rightTime,
                                    style: textTheme.displaySmall),
                                Text(detailInfo.allTime,
                                    style: textTheme.displaySmall),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) {
                            return 5.h;
                          },
                          itemCount: item.detailTimeOfFeeding.length),
                    )
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return 5.h;
              },
              itemCount: listOfData.length),
        ),
        Column(children: [
          Text('Вся история', style: textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor
          ),),
          SvgPicture.asset(Assets.icons.icArrowDown),
        ],),
        10.h
      ],
    );
  }
}

class RowTextTitle extends StatelessWidget {
  final String text;

  const RowTextTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Text(
      text,
      style: textTheme.bodySmall?.copyWith(color: AppColors.greyBrighterColor),
    );
  }
}