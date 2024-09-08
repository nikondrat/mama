

import 'package:flutter/material.dart';

import '../../data.dart';

class CustomButton extends StatefulWidget {
  final Function()? onTap;
  final Widget child;
  const CustomButton({super.key, this.onTap, required this.child});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              disabledBackgroundColor: AppColors.greyColor,
              backgroundColor: AppColors.purpleLighterBackgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              minimumSize: const Size.fromHeight(48)),
          onPressed: widget.onTap,
          child: widget.child),
    );
  }
}
