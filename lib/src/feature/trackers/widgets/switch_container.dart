import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class SwitchContainer extends StatefulWidget {
  const SwitchContainer({
    super.key,
    required this.title1,
    required this.title2,
  });

  final String title1;
  final String title2;

  @override
  State<SwitchContainer> createState() => _SwitchContainerState();
}

class _SwitchContainerState extends State<SwitchContainer> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 35,
      decoration: BoxDecoration(
        color: AppColors.purpleLighterBackgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ToggleButtons(
        fillColor: AppColors.whiteColor,
        selectedColor: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8),
        color: Colors.transparent,
        isSelected: isSelected,
        renderBorder: false,
        splashColor: Colors.transparent,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.title1,
              style: AppTextStyles.f14w700.copyWith(
                color: isSelected[0]
                    ? AppColors.primaryColor
                    : AppColors.greyBrighterColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              widget.title2,
              style: AppTextStyles.f14w700.copyWith(
                color: isSelected[1]
                    ? AppColors.primaryColor
                    : AppColors.greyBrighterColor,
              ),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index; // Тандалган элементти өзгөртүү
            }
          });
        },
      ),
    );
  }
}
