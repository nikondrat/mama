import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class OutlinButtonWidget extends StatelessWidget {
  const OutlinButtonWidget({
    super.key,
    this.onPressedOutlined,
  });

  final void Function()? onPressedOutlined;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      icon: const Icon(Icons.edit, color: AppColors.primaryColor),
      label: Text(
        t.trackers.note.title,
        style: AppTextStyles.f17w600.copyWith(
          color: AppColors.primaryColor,
        ),
      ),
      onPressed: onPressedOutlined,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(
          width: 2,
          color: AppColors.purpleLighterBackgroundColor,
        ),
        fixedSize: const Size(0, 48),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
