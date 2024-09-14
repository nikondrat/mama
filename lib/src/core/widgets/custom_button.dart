import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final Widget? child;
  final String? title;

  final EdgeInsets? padding;
  final double? borderRadius;

  final Color? backgroundColor;

  final TextStyle? textStyle;

  final double? height;

  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.child,
    this.backgroundColor,
    this.height,
    this.padding,
    this.borderRadius,
    this.textStyle,
  }) : assert(title != null || child != null);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final button = ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            disabledBackgroundColor: AppColors.greyColor,
            backgroundColor:
            backgroundColor ?? AppColors.purpleLighterBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 8),
            ),
            minimumSize: Size.fromHeight(height ?? 48)),
        onPressed: onTap,
        child: child ??
            AutoSizeText(
              title!,
              style: textStyle ?? textTheme.titleMedium,
            ));

    return padding != null ? Padding(padding: padding!, child: button) : button;
  }
}