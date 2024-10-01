import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.purpleLighterBackgroundColor,
          ),
          child: Center(
            child: Text(
              t.trackers.weight.add,
              style: AppTextStyles.f17w600.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
