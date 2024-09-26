import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class ButtonLeading extends StatelessWidget {
  final VoidCallback onTapButton;
  final TextStyle? labelStyle;
  const ButtonLeading({
    super.key,
    required this.onTapButton,
    this.labelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          fixedSize: Size(100, 46),
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.greyButton,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
        onPressed: () {
          onTapButton();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 20.0,
          color: AppColors.blackColor,
        ),
        label: Text(
          t.profile.backLeadingButton,
          style: labelStyle,
        ),
      ),
    );
  }
}
