import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyFlutterToggleButton extends StatefulWidget {
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
  MyFlutterToggleButton({
    super.key,
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
                item is Widget),
            'items list must contain either String, int, double or a Widget'),
        assert((outerContainerColor == null || outerContainerGradient == null),
            'Provide either outerContainerColor or outerContainerGradient, not both.'),
        assert((buttonColor == null || buttonGradient == null),
            'Provide either buttonColor or buttonGradient, not both.');

  @override
  MyFlutterToggleButtonState createState() => MyFlutterToggleButtonState();
}

class MyFlutterToggleButtonState extends State<MyFlutterToggleButton> {
  int? _selectedOptionIndex; // Default selected option index

  double get outerContainerHeight =>
      widget.buttonHeight + 2 * widget.outerContainerMargin;

  double get outerContainerWidth =>
      (widget.items.length * widget.buttonWidth) +
      (2 * widget.outerContainerMargin) +
      ((widget.items.length - 1) * widget.outerContainerMargin);

  @override
  Widget build(BuildContext context) {
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
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedOptionIndex = index;
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
                    color: _selectedOptionIndex == index
                        ? effectiveButtonColor
                        : null,
                    gradient: _selectedOptionIndex == index
                        ? effectiveButtonGradient
                        : null,
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                    border: _selectedOptionIndex == index
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
                    child: widget.items[index].runtimeType == String ||
                            widget.items[index].runtimeType == double ||
                            widget.items[index].runtimeType == int
                        ? Text(
                            widget.items[index].toString(),
                            style: TextStyle(
                              fontSize: widget.buttonTextFontSize,
                              fontWeight: _selectedOptionIndex == index
                                  ? widget.enableTextFontWeight
                                  : widget.disableTextFontWeight,
                              color: _selectedOptionIndex == index
                                  ? widget.enableTextColor
                                  : widget.disableTextColor,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : widget.items[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
