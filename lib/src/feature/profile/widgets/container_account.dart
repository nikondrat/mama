import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mama/src/core/core.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class ContainerAccountProfile extends StatelessWidget {
  final MaskTextInputFormatter? maskFormatter;
  final String helper;
  final String texthint;
  final int? maxlines;
  final TextStyle? labelStyle;
  final TextStyle? helperStyle;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final VoidCallback? onChange;
  const ContainerAccountProfile({
    super.key,
    required this.texthint,
    required this.helper,
    this.labelStyle,
    required this.controller,
    this.onChange,
    this.maskFormatter,
    this.keyboardType,
    this.maxlines,
    this.helperStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLines: maxlines,
              style: labelStyle,
              onChanged: (value) => onChange,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: helper,
                hintStyle: labelStyle,
                labelStyle: labelStyle,
              ),
            ),
            const Gap(8),
            Text(texthint, style: helperStyle),
          ],
        ),
      ),
    );
  }
}
