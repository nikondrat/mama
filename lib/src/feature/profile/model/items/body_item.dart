import 'package:flutter/material.dart';

class BodyItem {
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final int? maxLines;
  final String? hintText;

  BodyItem({
    this.hintStyle,
    this.titleStyle,
    this.maxLines,
    this.hintText,
  });
}
