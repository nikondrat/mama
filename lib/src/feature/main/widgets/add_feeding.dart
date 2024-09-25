import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/main/widgets/play_button.dart';
import '../main.dart';

class AddFeedingWidget extends StatelessWidget {
  const AddFeedingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    child: PlayerButton(
                  side: 'Левая',
                )),
                Expanded(
                    child: PlayerButton(
                  side: 'Правая',
                )),
              ],
            ),
          ),
          30.h,
          Text(
            'Добавить кормление',
            style: textTheme.titleMedium
                ?.copyWith(
                fontSize: 20,
                color: AppColors.greyBrighterColor),
          ),
          Text('Нажмите на  или добавьте вручную',
              style: textTheme.labelLarge
                  ?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.greyBrighterColor)),
          30.h,
          Row(
            children: [
              Expanded(
                flex: 1,
                child: CustomButton(
                  borderColor: AppColors.purpleLighterBackgroundColor,
                  backgroundColor: Colors.white,
                  onTap: () {},
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Assets.icons.icLearnMore, height: 25,),
                        2.w,
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            'Узнать больше',
                            style: textTheme.bodySmall
                                ?.copyWith(
                              fontSize: 10,
                                color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              10.w,
              Expanded(
                flex: 2,
                child: CustomButton(
                  backgroundColor: AppColors.purpleLighterBackgroundColor,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.icCalendar),
                      5.w,
                      Expanded(
                        child: Text(
                          'Добавить вручную',
                          style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: AppColors.primaryColor),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
