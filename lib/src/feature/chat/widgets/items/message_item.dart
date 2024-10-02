import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';

class MessageItemWidget extends StatelessWidget {
  final ChatEntity chatEntity;
  final MessageModel message;

  const MessageItemWidget({
    super.key,
    required this.message,
    required this.chatEntity,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return BubbleContainer(
        onTapReply: () => message.onTapReply!(),
        color: AppColors.whiteColor,
        isSender: message.isSender,
        chatEntity: chatEntity,
        avatarParticipant: message.avatarParticipant,
        child: chatEntity == ChatEntity.groupChat
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (chatEntity == ChatEntity.groupChat &&
                      message.nameReciever != null)
                    rowPersonalInfo(context),
                  if (message.replyItem != null)
                    replyWidget(
                      context,
                    ),
                  Text(
                    message.text,
                    style: textTheme.labelMedium!.copyWith(height: 0.0),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            : Stack(
                children: [
                  Column(
                    children: [
                      if (message.replyItem != null)
                        replyWidget(
                          context,
                        ),
                      Text(
                        message.text,
                        style: textTheme.labelMedium!.copyWith(height: 0.0),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Text(
                      DateFormat('kk:mm').format(message.time!),
                      overflow: TextOverflow.fade,
                      style: textTheme.labelSmall!
                          .copyWith(color: AppColors.textGreyColor),
                    ),
                  ),
                ],
              ));
  }

  Widget replyWidget(context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Column(
      children: [
        5.h,
        IntrinsicHeight(
          child: Row(
            children: [
              VerticalDivider(
                  width: 3, thickness: 2, color: AppColors.primaryColor),
              5.w,
              Expanded(
                child: Reply(
                  replyItem: message.replyItem!,
                  textStyleName: textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                  ),
                  textStyleText: textTheme.labelMedium!.copyWith(
                      color: AppColors.greyBrighterColor, height: 0.0),
                ),
              ),
            ],
          ),
        ),
        5.h,
      ],
    );
  }

  Widget rowPersonalInfo(context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Row(
      mainAxisAlignment:
          chatEntity == ChatEntity.groupChat && message.nameReciever != null
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
      children: [
        if (chatEntity == ChatEntity.groupChat && message.nameReciever != null)
          Row(
            children: [
              //TODO! если overflow
              SizedBox(
                width: MediaQuery.of(context).size.width * .43,
                child: AutoSizeText(
                  message.nameReciever!,
                  overflow: TextOverflow.fade,
                  style: textTheme.bodyMedium!.copyWith(letterSpacing: 0.0),
                ),
              ),
              3.w,
              if (message.profession != null)
                ProfessionBox(profession: message.profession!)
            ],
          ),
        Text(
          DateFormat('kk:mm').format(message.time!),
          overflow: TextOverflow.fade,
          style: textTheme.labelSmall!.copyWith(color: AppColors.textGreyColor),
        ),
      ],
    );
  }
}
