
import 'package:flutter/material.dart';
import 'package:flutter_toggle_button/flutter_toggle_button.dart';
import '../../data.dart';

class CustomToggleButton extends StatelessWidget {
  final List<String> items;
  final Function(int index) onTap;
  final double btnWidth;
  final double btnHeight;
  final AlignmentGeometry? alignment;

  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomToggleButton({
    super.key,
    required this.items,
    required this.onTap,
    this.fontSize,
    this.fontWeight,
    this.alignment, required this.btnWidth, required this.btnHeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: FlutterToggleButton(
        outerContainerMargin: 3,
        buttonWidth: btnWidth,
        buttonHeight: btnHeight,
        buttonColor: Colors.white,
        enableTextColor: AppColors.primaryColor,
        disableTextColor: AppColors.greyBrighterColor,
        disableTextFontWeight: fontWeight ?? FontWeight.w700,
        buttonTextFontSize: fontSize ?? 14,
        borderRadius: 6,
        outerContainerColor: const Color(0xFFE1E6FF),
        onTap: onTap,
        items: items,
      ),
    );
  }
}
