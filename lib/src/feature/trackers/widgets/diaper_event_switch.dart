import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class DiaperStateSwitch extends StatelessWidget {
  const DiaperStateSwitch({
    super.key,
    this.selectedIndex,
    this.onTap,
    required this.isPopupVisible,
  });

  final int? selectedIndex;
  final void Function(int)? onTap;
  final bool isPopupVisible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          height: 56,
          decoration: BoxDecoration(
            color: selectedIndex == 0
                ? AppColors.purpleLighterBackgroundColor
                : selectedIndex == 1
                    ? AppColors.greenLighterBackgroundColor
                    : AppColors.yellowBackgroundColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        Positioned(
          // bottom: 15,
          child: SizedBox(
            height: 54,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                barItem(
                  t.profile.bottomBarHome,
                  0,
                  AppColors.primaryColor,
                  context,
                ),
                barItem(
                  t.profile.bottomBarDiaries,
                  1,
                  AppColors.greenTextColor,
                  context,
                ),
                barItem(
                  t.profile.bottomBarChats,
                  2,
                  AppColors.orangeTextColor,
                  context,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget barItem(String text, int index, Color color, BuildContext context) {
    return GestureDetector(
      onTap: () => onTap!(index),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: selectedIndex != index
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text,
                    style: AppTextStyles.f17w600.copyWith(color: color),
                  ),
                ],
              )
            : isPopupVisible == true
                ? SizedBox(
                    child: Card(
                      color: AppColors.whiteColor,
                      shadowColor: AppColors.skyBlue,
                      elevation: 1,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text,
                            style: AppTextStyles.f17w600.copyWith(color: color),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        text,
                        style: AppTextStyles.f17w600.copyWith(color: color),
                      ),
                    ],
                  ),
      ),
    );
  }
}
