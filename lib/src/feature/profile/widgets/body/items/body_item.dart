import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import 'custom_item.dart';
import '../decoration.dart';
import 'input.dart';
import 'item_with_input.dart';
import 'item_with_switch.dart';

class BodyItemWidget extends StatelessWidget {
  final BodyItem item;

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

    final bool isFieldItem = item is InputItem;

    switch (item) {
      case InputItem _:
        return Padding(
          padding: const EdgeInsets.only(
            bottom: 8,
          ),
          child: BodyItemDecoration(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isFieldItem ? InputItemWidget(item: item as InputItem) : 8.h,
              if (item.hintText != null)
                AutoSizeText(item.hintText!, style: hintStyle),
            ],
          )),
        );
      case ItemWithInput _:
        return ItemWithInputWidget(item: item as ItemWithInput);
      case CustomBodyItem _:
        return CustomBodyItemWidget(item: item as CustomBodyItem);
      case ItemWithSwitch _:
        return ItemWithSwitchWidget(item: item as ItemWithSwitch);
      default:
        return SizedBox.shrink();
    }
  }
}
