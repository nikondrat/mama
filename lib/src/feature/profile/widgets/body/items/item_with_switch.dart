import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ItemWithSwitchWidget extends StatelessWidget {
  final ItemWithSwitch item;
  const ItemWithSwitchWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    final TextStyle helpersStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      letterSpacing: 0,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      item.title,
                      style: item.titleStyle,
                    ),
                  ),
                ],
              ),
              if (item.subtitle != null)
                Row(
                  children: [
                    Expanded(
                      child: AutoSizeText(
                        item.subtitle!,
                        style: helpersStyle,
                      ),
                    ),
                    20.w
                  ],
                )
            ],
          ),
        ),
        CupertinoSwitch(
          value: item.value,
          activeColor: AppColors.primaryColor,
          trackColor: AppColors.greyColor,
          onChanged: (value) {
            if (item.onChanged != null) {
              item.onChanged!(value);
            }
          },
        ),
      ],
    );
  }
}
