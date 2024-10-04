import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/feature.dart';

class ChatItemSingle extends StatelessWidget {
  final ChatModelSingle chat;
  const ChatItemSingle({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ChatItem(
      chatEntity: ChatEntity.singleChat,
      chatItem: ChatItemModel(
        avatarUrl: chat.participant1.avatarUrl!,
        name: '${chat.participant1.firstName} ${chat.participant1.secondName} ',
        isAttach: chat.lastMessage!.filePath != null,
        profession: chat.participant1.profession ?? null,
        unreadMessages: chat.participant1Unread,
        lastMessageName: chat.lastMessage!.nikName,
        lastMessageText: chat.lastMessage!.text,
      ),
    );
  }
}

class ChatItemGroup extends StatelessWidget {
  final ChatModelGroup chat;
  const ChatItemGroup({super.key, required this.chat});

  @override
  Widget build(BuildContext context) {
    return ChatItem(
      chatEntity: ChatEntity.groupChat,
      chatItem: ChatItemModel(
        avatarUrl: chat.groupChatInfo.avatar,
        name: chat.groupChatInfo.name,
        isAttach: chat.lastMessage!.filePath != null,
        profession:
            chat.participant.profession!, //sender last message profession
        unreadMessages: chat.unreadMessages,
        lastMessageName: chat.lastMessage!.nikName,
        lastMessageText: chat.lastMessage!.text,
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final ChatItemModel chatItem;
  final ChatEntity chatEntity;
  const ChatItem({super.key, required this.chatItem, required this.chatEntity});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Row(
      children: [
        Flexible(
          flex: 1,
          child: CircleAvatar(
              radius: 28,
              backgroundImage: AssetImage(
                chatItem.avatarUrl,
              )),
        ),
        8.w,
        Flexible(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: chatItem.name,
                          style: textTheme.bodyMedium,
                        ),
                        if (chatEntity == ChatEntity.singleChat)
                          if (chatItem.profession != null)
                            WidgetSpan(
                              child: ProfessionBox(
                                profession: chatItem.profession!,
                              ),
                            ),
                      ],
                    ),
                  ),
                  if (chatItem.unreadMessages != null)
                    UnreadBox(
                      unread: chatItem.unreadMessages!,
                    ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    flex: 7,
                    child: RichText(
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: chatItem.lastMessageName,
                            style: textTheme.labelMedium,
                          ),
                          if (chatEntity == ChatEntity.groupChat)
                            if (chatItem.profession != null)
                              WidgetSpan(
                                child: ProfessionBox(
                                  profession: chatItem.profession!,
                                ),
                              ),
                          TextSpan(
                            text: ': ',
                            style: textTheme.labelMedium,
                          ),
                          TextSpan(
                            text: chatItem.lastMessageText,
                            style: textTheme.labelMedium!
                                .copyWith(color: AppColors.greyBrighterColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (chatItem.isAttach)
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        Assets.icons.clip.path,
                        height: 33,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
