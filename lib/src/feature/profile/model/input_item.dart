import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'body_item.dart';

class InputItem extends BodyItem {
  final String? inputHint;
  final String hintText;
  final String controlName;
  final TextStyle? inputHintStyle;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final MaskTextInputFormatter? maskFormatter;

  final Function(String? value)? onChanged;

  InputItem({
    required this.controlName,
    required this.hintText,
    this.inputHint,
    this.onChanged,
    this.textInputAction,
    this.inputHintStyle,
    this.maskFormatter,
    this.keyboardType,
    super.titleStyle,
    super.maxLines,
  });
}
