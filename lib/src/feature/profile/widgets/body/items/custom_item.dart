import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class CustomBodyItemWidget extends StatelessWidget {
  final CustomBodyItem item;

  const CustomBodyItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final TextStyle helpersStyle = textTheme.bodySmall!.copyWith(
      fontSize: 10,
      letterSpacing: 0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AutoSizeText(
              item.title,
              style:
                  textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400),
            ),
            if (item.subTitle != null)
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      item.subTitle!,
                      style: item.hintStyle ?? helpersStyle,
                    ),
                  ),
                  20.w
                ],
              )
          ],
        )),
        if (item.body != null) item.body!,
      ],
    );
  }
}
