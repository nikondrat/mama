import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomBodyItem extends BodyItem {
  final String title;
  final Widget? body;
  final String? subTitle;

  CustomBodyItem({
    required this.title,
    this.body,
    this.subTitle,
    super.hintText,
    super.titleStyle,
    super.hintStyle,
    super.maxLines,
  });
}
