import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class BarItem extends StatelessWidget {
  const BarItem(
    this.text,
    this.index,
    this.color, {
    this.onTap,
    this.selectedIndex,
    required this.isPopupVisible,
    super.key,
  });
  final String text;
  final int index;
  final Color color;
  final int? selectedIndex;
  final void Function(int)? onTap;
  final bool isPopupVisible;

  @override
  Widget build(BuildContext context) {
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
