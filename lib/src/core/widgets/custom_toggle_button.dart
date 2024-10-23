import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ToggleButtonItem {
  final String text;
  final IconModel? icon;

  const ToggleButtonItem({required this.text, this.icon});
}

class CustomToggleButton extends StatelessWidget {
  final int initialIndex;

  final List<dynamic> items;
  final Function(int index) onTap;
  final double btnWidth;
  final double btnHeight;
  final AlignmentGeometry? alignment;

  final double? fontSize;
  final FontWeight? fontWeight;

  const CustomToggleButton(
      {super.key,
      this.initialIndex = 0,
      required this.items,
      required this.onTap,
      this.fontSize,
      this.fontWeight,
      this.alignment,
      required this.btnWidth,
      required this.btnHeight});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: FlutterToggleButton(
        initialIndex: initialIndex,
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

/// A customizable toggle button widget.
///
/// The [FlutterToggleButton] widget allows you to create a row of toggle buttons
/// with various customization options for colors, gradients, text styles, and more.
class FlutterToggleButton extends StatefulWidget {
  final int initialIndex;

  /// List of items to display as buttons.
  /// Each item can be a String, int, double, or Widget.
  final List<dynamic> items;

  /// Margin around the outer container.
  final double outerContainerMargin;

  /// Width of each button.
  final double buttonWidth;

  /// Height of each button.
  final double buttonHeight;

  /// Border radius for buttons and outer container.
  final double borderRadius;

  /// Font size of the button text.
  final double buttonTextFontSize;

  /// Font weight of the text when the button is enabled.
  final FontWeight enableTextFontWeight;

  /// Font weight of the text when the button is disabled.
  final FontWeight disableTextFontWeight;

  /// Text color when the button is enabled.
  final Color enableTextColor;

  /// Text color when the button is disabled.
  final Color disableTextColor;

  /// Solid color for the outer container.
  /// Provide either this or [outerContainerGradient], not both.
  final Color? outerContainerColor;

  /// Solid color for the buttons.
  /// Provide either this or [buttonGradient], not both.
  final Color? buttonColor;

  /// Gradient for the outer container.
  /// Provide either this or [outerContainerColor], not both.
  final LinearGradient? outerContainerGradient;

  /// Gradient for the buttons.
  /// Provide either this or [buttonColor], not both.
  final LinearGradient? buttonGradient;

  /// Border color of the outer container.
  final Color outerContainerBorderColor;

  /// Border width of the outer container.
  final double outerContainerBorderWidth;

  /// Border color of the buttons.
  final Color buttonBorderColor;

  /// Border width of the buttons.
  final double buttonBorderWidth;

  /// Callback function when a button is tapped.
  final void Function(int)? onTap;

  /// Creates a [FlutterToggleButton] widget.
  ///
  /// The [items] parameter is required and must contain a list of String, int,
  /// double, or Widget. Other parameters are optional and allow for customization
  /// of the widget's appearance and behavior.
  FlutterToggleButton({
    super.key,
    this.initialIndex = 0,
    required this.items,
    this.outerContainerMargin = 7.87,
    this.buttonWidth = 139,
    this.buttonHeight = 68,
    this.borderRadius = 108,
    this.buttonTextFontSize = 22,
    this.enableTextFontWeight = FontWeight.w600,
    this.disableTextFontWeight = FontWeight.w500,
    this.enableTextColor = Colors.white,
    this.disableTextColor = const Color(0xff7A7A7A),
    this.outerContainerColor,
    this.buttonColor,
    this.outerContainerGradient,
    this.buttonGradient,
    this.outerContainerBorderColor = Colors.transparent,
    this.outerContainerBorderWidth = 0,
    this.buttonBorderColor = Colors.transparent,
    this.buttonBorderWidth = 0,
    this.onTap,
  })  : assert(
            items.every((item) =>
                item is String ||
                item is double ||
                item is int ||
                item is Widget ||
                item is ToggleButtonItem),
            'items list must contain either String, int, double or a Widget'),
        assert((outerContainerColor == null || outerContainerGradient == null),
            'Provide either outerContainerColor or outerContainerGradient, not both.'),
        assert((buttonColor == null || buttonGradient == null),
            'Provide either buttonColor or buttonGradient, not both.');

  @override
  FlutterToggleButtonState createState() => FlutterToggleButtonState();
}

class FlutterToggleButtonState extends State<FlutterToggleButton> {
  int selectedOptionIndex = 0;

  double get outerContainerHeight =>
      widget.buttonHeight + 2 * widget.outerContainerMargin;

  double get outerContainerWidth =>
      (widget.items.length * widget.buttonWidth) +
      (2 * widget.outerContainerMargin) +
      ((widget.items.length - 1) * widget.outerContainerMargin);

  @override
  void initState() {
    selectedOptionIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Default selected option index
    // Default colors if none are provided
    const Color defaultOuterContainerColor =
        Colors.grey; // Set a default color for the outer container
    const Color defaultButtonColor =
        Colors.blue; // Set a default color for the button

    final Color effectiveOuterContainerColor =
        widget.outerContainerColor ?? defaultOuterContainerColor;
    final LinearGradient? effectiveOuterContainerGradient =
        widget.outerContainerColor == null
            ? widget.outerContainerGradient
            : null;

    final Color effectiveButtonColor = widget.buttonColor ?? defaultButtonColor;
    final LinearGradient? effectiveButtonGradient =
        widget.buttonColor == null ? widget.buttonGradient : null;

    return Column(
      children: [
        Container(
          height: outerContainerHeight,
          width: outerContainerWidth,
          decoration: BoxDecoration(
            color: effectiveOuterContainerColor,
            gradient: effectiveOuterContainerGradient,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: widget.outerContainerBorderWidth > 0
                ? Border.all(
                    color: widget.outerContainerBorderColor,
                    width: widget.outerContainerBorderWidth,
                  )
                : null,
          ),
          padding: EdgeInsets.all(widget.outerContainerMargin),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              widget.items.length,
              (index) {
                final item = widget.items[index];

                final Widget title = Text(
                  item is ToggleButtonItem
                      ? item.text
                      : '${widget.items[index]}',
                  style: TextStyle(
                    fontSize: widget.buttonTextFontSize,
                    fontWeight: selectedOptionIndex == index
                        ? widget.enableTextFontWeight
                        : widget.disableTextFontWeight,
                    color: selectedOptionIndex == index
                        ? widget.enableTextColor
                        : widget.disableTextColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                );

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedOptionIndex = index;
                    });
                    if (widget.onTap != null) {
                      widget.onTap!(index);
                    }
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: widget.buttonWidth,
                    height: widget.buttonHeight,
                    decoration: BoxDecoration(
                      color: selectedOptionIndex == index
                          ? effectiveButtonColor
                          : null,
                      gradient: selectedOptionIndex == index
                          ? effectiveButtonGradient
                          : null,
                      borderRadius: BorderRadius.circular(widget.borderRadius),
                      border: selectedOptionIndex == index
                          ? widget.buttonBorderWidth > 0
                              ? Border.all(
                                  color: widget.buttonBorderColor,
                                  width: widget.buttonBorderWidth,
                                )
                              : null
                          : null,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: item.runtimeType == String ||
                              item.runtimeType == double ||
                              item.runtimeType == int
                          ? title
                          : item.runtimeType == ToggleButtonItem
                              ? Row(
                                  children: [
                                    if (item.icon != null) ...[
                                      IconWidget(
                                        model: (item as ToggleButtonItem)
                                            .icon!
                                            .copyWith(
                                                color: selectedOptionIndex ==
                                                        index
                                                    ? widget.enableTextColor
                                                    : widget.disableTextColor),
                                      ),
                                      4.w,
                                    ],
                                    title,
                                  ],
                                )
                              : item,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
