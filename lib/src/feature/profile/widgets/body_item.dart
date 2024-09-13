import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'decoration.dart';

class BodyItemWidget extends StatelessWidget {
  final InputItem item;

  const BodyItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle hintStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.w700,
    );

    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8,
      ),
      child: BodyItemDecoration(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ReactiveTextField(
            style: item.titleStyle,
            maxLines: item.maxLines,
            keyboardType: item.keyboardType,
            inputFormatters: [
              if (item.maskFormatter != null) item.maskFormatter!
            ],
            onChanged: (control) {
              if (item.onChanged != null) {
                item.onChanged!(control.value as String?);
              }
            },
            textInputAction: item.textInputAction,
            formControlName: item.controlName,
            onTapOutside: (event) {},
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: item.inputHint,
              hintStyle: item.inputHintStyle,
            ),
          ),
          8.h,
          AutoSizeText(item.hintText, style: hintStyle),
        ],
      )),
    );
  }
}
