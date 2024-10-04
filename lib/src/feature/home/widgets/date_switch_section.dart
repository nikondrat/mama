import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';

class DateSwitchSection extends StatelessWidget {
  final VoidCallback leftButtonOnPressed;
  final VoidCallback rightButtonOnPressed;
  final VoidCallback calendarButtonOnPressed;

  const DateSwitchSection({
    super.key,
    required this.leftButtonOnPressed,
    required this.rightButtonOnPressed,
    required this.calendarButtonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// #switch
        Row(
          children: [
            /// #left button
            IconButton(
              onPressed: leftButtonOnPressed,
              icon: SvgPicture.asset(
                Assets.icons.icArrowLeftFilled,
                color: AppColors.primaryColor,
              ),
            ),

            /// #number date, word date
            Column(
              children: [
                /// #number date
                Text(
                  t.home.septemberTwentySecond.title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),

                /// #word date
                Text(
                  t.home.today.title,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.greyBrighterColor,
                  ),
                ),
              ],
            ),

            /// #right button
            IconButton(
              onPressed: rightButtonOnPressed,
              icon: SvgPicture.asset(
                Assets.icons.icArrowRightFilled,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),

        /// #calendar button
        Material(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AppColors.purpleLighterBackgroundColor,
          child: InkWell(
            onTap: calendarButtonOnPressed,
            borderRadius: BorderRadius.all(Radius.circular(16)),
            child: SizedBox(
              width: 48,
              height: 48,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: SvgPicture.asset(
                  Assets.icons.icCalendarBadgeClockFilled,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
