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
                BarItem(
                  onTap: (index) => onTap!(index),
                  isPopupVisible: isPopupVisible,
                  t.trackers.wet.wet,
                  0,
                  AppColors.primaryColor,
                ),
                BarItem(
                  onTap: (index) => onTap!(index),
                  isPopupVisible: isPopupVisible,
                  t.trackers.mixed.mixed,
                  1,
                  AppColors.greenTextColor,
                ),
                BarItem(
                  onTap: (index) => onTap!(index),
                  isPopupVisible: isPopupVisible,
                  t.trackers.dirty.dirty,
                  2,
                  AppColors.orangeTextColor,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
