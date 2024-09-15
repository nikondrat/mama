
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
            style: textTheme.bodyLarge
                ?.copyWith(color: AppColors.greyBrighterColor),
          ),
          Text('Нажмите на  или добавьте вручную',
              style: textTheme.displaySmall
                  ?.copyWith(color: AppColors.greyBrighterColor)),
          30.h,
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  backgroundColor: Colors.white,
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.icons.icLearnMore),
                      5.w,
                      Text(
                        'Узнать\nбольше',
                        style: textTheme.bodySmall
                            ?.copyWith(color: AppColors.primaryColor),
                      )
                    ],
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
                      Text(
                        'Добавить вручную',
                        style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryColor),
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