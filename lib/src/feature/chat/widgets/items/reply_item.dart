import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';

class ReplyItemWidget extends StatelessWidget {
  final ReplyItem replyItem;
  final VoidCallback? onTapClose;
  const ReplyItemWidget({super.key, required this.replyItem, this.onTapClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.lightPirple),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            flex: 1,
            child: Image.asset(
              Assets.icons.replyFilled.path,
              height: 28,
            ),
          ),
          Expanded(
            flex: 6,
            child: Reply(replyItem: replyItem),
          ),
          Flexible(
            flex: 1,
            child: IconButton(
              onPressed: () {
                onTapClose!();
              },
              icon: Image.asset(
                Assets.icons.close.path,
                height: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
