
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/widgets/custom_toggle_button.dart';
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
          t.feeding.story,
          style: textTheme.titleLarge
              ?.copyWith(
            color: Colors.black,
            fontSize: 20
          ),
        ),
        15.h,
        CustomToggleButton(
            alignment: Alignment.topLeft,
            items: [
              t.feeding.newS, t.feeding.old
            ],
            onTap: (index){

            },
            btnWidth: 64,
            btnHeight: 26),
        15.h,
        TableWidget(
          columnTitles: [
            t.feeding.feedingEndTime,
            t.feeding.l,
            t.feeding.r,
            t.feeding.general,
          ],
          listOfData: listOfData,),

        Column(children: [
          Text(t.feeding.wholeStory, style: textTheme.labelLarge),
          SvgPicture.asset(Assets.icons.icArrowDown),
        ],),
        10.h
      ],
    );
  }
}