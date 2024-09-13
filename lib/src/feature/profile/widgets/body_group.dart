import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import 'body_item.dart';

class BodyGroup extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final List<BodyItemWidget> items;
  const BodyGroup({
    super.key,
    required this.title,
    this.titleStyle,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle titleStyle = textTheme.labelLarge!;

    return Column(
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
        ...items
      ],
    );
  }
}
