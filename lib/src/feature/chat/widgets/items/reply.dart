import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';

class Reply extends StatelessWidget {
  final ReplyItem replyItem;
  final TextStyle? textStyleName;
  final TextStyle? textStyleText;
  const Reply({
    super.key,
    required this.replyItem,
    this.textStyleName,
    this.textStyleText,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (replyItem.nameReply != 'null')
          Text(
            replyItem.nameReply,
            style: textStyleName ??
                textTheme.labelLarge!.copyWith(
                  color: AppColors.blackColor,
                ),
            textAlign: TextAlign.left,
          ),
        Text(
          replyItem.textReply,
          style: textStyleText ??
              textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                  color: AppColors.greyBrighterColor,
                  height: 0.0),
          softWrap: true,
          maxLines: 2,
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
