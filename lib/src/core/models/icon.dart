import 'package:flutter/widgets.dart';

class IconModel {
  final IconData? icon;
  final String? iconPath;
  final Color? color;

  final Size? size;

  final Widget? customIcon;

  IconModel({
    this.icon,
    this.iconPath,
    this.color,
    this.size,
    this.customIcon,
  }) : assert(icon != null || iconPath != null || customIcon != null);

  IconModel copyWith({
    IconData? icon,
    String? iconPath,
    Color? color,
    Size? size,
    Widget? customIcon,
  }) {
    return IconModel(
      icon: icon ?? this.icon,
      iconPath: iconPath ?? this.iconPath,
      color: color ?? this.color,
      size: size ?? this.size,
      customIcon: customIcon ?? this.customIcon,
    );
  }
}


