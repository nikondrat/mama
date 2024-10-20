import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'body_item.dart';

class InputItem extends BodyItem {
  final bool autoFocus;
  final String? inputHint;
  final String controlName;
  final TextStyle? inputHintStyle;
  final bool isCollapsed;

  final EdgeInsets? contentPadding;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final TextAlign? textAlign;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final MaskTextInputFormatter? maskFormatter;

  final Color? backgroundColor;
  final bool needBackgroundOnFocus;

  final Function(String? value)? onChanged;

  InputItem({
    required this.controlName,
    this.autoFocus = false,
    super.hintText,
    this.errorBorder,
    this.inputHint,
    this.onChanged,
    this.textAlign,
    super.hintStyle,
    this.textInputAction,
    this.inputHintStyle,
    this.maskFormatter,
    this.keyboardType,
    super.titleStyle,
    super.maxLines,
    this.border,
    this.isCollapsed = false,
    this.backgroundColor,
    this.contentPadding,
    this.needBackgroundOnFocus = false,
  });
}
