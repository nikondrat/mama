import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ElevateButtonWidget extends StatelessWidget {
  const ElevateButtonWidget({
    super.key,
    this.onPressedElevated,
  });

  final void Function()? onPressedElevated;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedElevated,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.purpleLighterBackgroundColor,
        fixedSize: const Size(0, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        t.trackers.add.title,
        style: AppTextStyles.f17w600.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
