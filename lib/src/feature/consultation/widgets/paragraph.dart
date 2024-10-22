import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ParagraphWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const ParagraphWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          title,
          maxLines: 1,
          style: textTheme.headlineSmall!.copyWith(
            fontSize: 20,
          ),
        ),
        16.h,
        ...children,
      ],
    );
  }
}
