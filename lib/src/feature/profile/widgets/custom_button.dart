import 'package:flutter/material.dart';

import '../../../core/constant/constant.dart';

class CButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final IconData? icon;
  final Color? color;
  const CButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: color == null
              ? AppColors.purpleLighterBackgroundColor
              : AppColors.redLighterBackgroundColor,
          backgroundColor: color == null
              ? AppColors.purpleLighterBackgroundColor
              : AppColors.redLighterBackgroundColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          minimumSize: const Size.fromHeight(48)),
      onPressed: onPressed,
      child: icon != null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Icon(
                    icon,
                    color: color ?? AppColors.primaryColor,
                  ),
                ),
                Text(
                  text,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: color ?? AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                ),
              ],
            )
          : Text(
              text,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: color == null
                      ? AppColors.primaryColor
                      : AppColors.redColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 17),
            ),
    );
  }
}
