import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

class InputItemWidget extends StatelessWidget {
  final InputItem item;
  const InputItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      style: item.titleStyle,
      maxLines: item.maxLines,
      keyboardType: item.keyboardType,
      inputFormatters: [if (item.maskFormatter != null) item.maskFormatter!],
      onChanged: (control) {
        if (item.onChanged != null) {
          item.onChanged!(control.value as String?);
        }
      },
      textAlign: item.textAlign ?? TextAlign.start,
      textInputAction: item.textInputAction,
      formControlName: item.controlName,
      onTapOutside: (event) {},
      validationMessages: {
        ValidationMessage.required: (_) => '',
      },
      decoration: InputDecoration(
        errorText: null,
        border: item.border ?? InputBorder.none,
        errorBorder: item.errorBorder ??
            OutlineInputBorder(
                borderRadius: 6.r,
                borderSide: BorderSide(
                  color: AppColors.redColor,
                  width: 2,
                )),
        enabledBorder: item.border,
        isCollapsed: item.isCollapsed,
        contentPadding: item.contentPadding,
        filled: item.backgroundColor != null,
        fillColor: item.backgroundColor,
        hintText: item.inputHint,
        hintStyle: item.inputHintStyle,
      ),
    );
  }
}
