import 'package:flutter/foundation.dart';

class ButtonModel {
  final String title;
  final VoidCallback onTap;

  const ButtonModel({
    required this.title,
    required this.onTap,
  });
}
