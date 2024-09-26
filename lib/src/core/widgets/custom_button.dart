import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:mama/src/core/models/icon.dart';
import 'package:mama/src/core/widgets/icon_widget.dart';
import 'package:mama/src/data.dart'; // Ваш файл с цветами (AppColors).

enum CustomButtonType {
  filled,
  outline,
}

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String? title;
  final IconModel? icon;

  final EdgeInsets? contentPadding;
  final EdgeInsets? padding;
  final double? borderRadius;

  final Color? backgroundColor;

  final TextStyle? textStyle;

  final double? height;
  final double? width;

  final CustomButtonType type;

  final bool isSmall;

  const CustomButton({
    super.key,
    this.onTap,
    this.title,
    this.icon,
    this.backgroundColor,
    this.height,
    this.width,
    this.padding,
    this.contentPadding,
    this.borderRadius,
    this.textStyle,
    this.isSmall = true,
    this.type = CustomButtonType.filled,
  }) : assert(title != null);

  Color _getDarkerColor(Color color) {
    final HSLColor hsl = HSLColor.fromColor(color);
    final HSLColor darkerHsl =
    hsl.withLightness((hsl.lightness - 0.3).clamp(0.0, 1.0));
    return darkerHsl.toColor();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final bool isFilled = type == CustomButtonType.filled;

    final Color bgColor =
        backgroundColor ?? AppColors.purpleLighterBackgroundColor;

    final Color textColor = _getDarkerColor(bgColor);

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      elevation: 0,
      minimumSize: Size(width ?? 64.0, height ?? 40.0),
      backgroundColor: !isFilled ? Colors.transparent : bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 8),
        side: !isFilled
            ? BorderSide(
          color: AppColors.purpleLighterBackgroundColor,
          width: 2,
        )
            : BorderSide.none,
      ),
      padding:
      contentPadding ?? EdgeInsets.symmetric(vertical: 16, horizontal: 16),
    );

    return _PaddingWidget(
      padding: padding,
      child: ElevatedButton(
        onPressed: onTap,
        style: buttonStyle,
        child: Row(
          mainAxisSize: isSmall ? MainAxisSize.min : MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              IconWidget(
                  model: icon!.copyWith(
                color: textColor,
              )),
              8.w,
            ],
            Flexible(
              child: AutoSizeText(
                title!,
                style: textStyle ??
                    textTheme.titleMedium!.copyWith(
                        color: textColor,
                        fontWeight: FontWeight.w600,
                        height: 1.2),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PaddingWidget extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  const _PaddingWidget({
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return padding != null ? Padding(padding: padding!, child: child) : child;
  }
}