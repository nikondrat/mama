import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputItemWidget extends StatefulWidget {
  final InputItem item;
  const InputItemWidget({
    super.key,
    required this.item,
  });

  @override
  State<InputItemWidget> createState() => _InputItemWidgetState();
}

class _InputItemWidgetState extends State<InputItemWidget> {
  FocusNode focusNode = FocusNode();

  late Color? backgroundColor = widget.item.backgroundColor;

  Color? hintColor;

  @override
  void initState() {
    focusNode.addListener(() {
      setState(() {
        if (focusNode.hasFocus && widget.item.needBackgroundOnFocus) {
          backgroundColor = AppColors.primaryColor;
          hintColor = AppColors.softPeach;
        } else {
          backgroundColor = widget.item.backgroundColor;
          hintColor = null;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return ReactiveTextField(
      autofocus: widget.item.autoFocus,
      focusNode: focusNode,
      style: widget.item.titleStyle ??
          textTheme.bodyLarge?.copyWith(color: hintColor),
      maxLines: widget.item.maxLines,
      keyboardType: widget.item.keyboardType,
      inputFormatters: [
        if (widget.item.maskFormatter != null) widget.item.maskFormatter!
      ],
      onChanged: (control) {
        if (widget.item.onChanged != null) {
          widget.item.onChanged!(control.value as String?);
        }
      },
      textAlign: widget.item.textAlign ?? TextAlign.start,
      textInputAction: widget.item.textInputAction,
      formControlName: widget.item.controlName,
      onTapOutside: (event) {},
      validationMessages: {
        ValidationMessage.required: (_) => '',
      },
      cursorColor: hintColor,
      decoration: InputDecoration(
        errorText: null,
        border: widget.item.border ?? InputBorder.none,
        errorBorder: widget.item.errorBorder ??
            OutlineInputBorder(
                borderRadius: 6.r,
                borderSide: const BorderSide(
                  color: AppColors.redColor,
                  width: 2,
                )),
        enabledBorder: widget.item.border,
        isCollapsed: widget.item.isCollapsed,
        contentPadding: widget.item.contentPadding,
        filled: backgroundColor != null,
        fillColor: backgroundColor,
        hintText: widget.item.inputHint ?? t.profile.inputHint,
        hintStyle: widget.item.inputHintStyle?.copyWith(
          color: hintColor,
        ),
      ),
    );
  }
}
