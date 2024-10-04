import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'decoration.dart';

class BodyGroup extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<Widget> items;
  // final List<BodyItemWidget> items;
  final FormGroup? formGroup;
  final EdgeInsets? padding;
  final bool isDecorated;
  const BodyGroup({
    super.key,
    required this.title,
    this.titleStyle,
    required this.items,
    this.formGroup,
    this.padding,
    this.isDecorated = false,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titleStyle = textTheme.labelLarge!;

    final List<Widget> items = [
      ...this.items.map((e) {
        return Padding(
            padding: padding ?? const EdgeInsets.symmetric(vertical: 8), child: e);
      })
    ];

    final Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
        8.h,
        if (isDecorated)
          BodyItemDecoration(child: Column(children: items))
        else
          ...items
      ],
    );

    return formGroup == null
        ? child
        : ReactiveForm(
            formGroup: formGroup!,
            child: child,
          );
  }
}
