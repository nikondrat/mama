import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ChatsBodyWidget extends StatefulWidget {
  final ChatsViewStore store;
  const ChatsBodyWidget({
    super.key,
    required this.store,
  });

  @override
  State<ChatsBodyWidget> createState() => _ChatsBodyWidgetState();
}

class _ChatsBodyWidgetState extends State<ChatsBodyWidget> {
  @override
  void initState() {
    widget.store.fetchChats();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return LoadingWidget(
      future: widget.store.fetchChatsFuture,
      builder: (v) => ListView(
        children: [
          CardWithoutMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  t.chat.groupChatsListTitle,
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge!
                      .copyWith(color: AppColors.greyBrighterColor),
                ),
                8.h,
                Flexible(
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.store.groups!.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      indent: MediaQuery.of(context).size.width * 0.15,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatScreen(
                                  groupChat: widget.store.groups![index],
                                  listMessages: listGroup,
                                  chatEntity: ChatEntity.groupChat,
                                ),
                              ));
                        },
                        child: ChatItemGroup(
                          chat: widget.store.groups![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          CardWithoutMargin(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: CustomToggleButton(
                    items: [
                      t.chat.buttonToogleAll,
                      t.chat.buttonToogleSpecialist,
                    ],
                    onTap: (index) {
                      // setState(() {
                      //   toogleSelected = index;
                      //   filterSingle();
                      // });
                    },
                    btnWidth: MediaQuery.of(context).size.width / 2.3,
                    btnHeight: 38,
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: widget.store.chats!.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    indent: MediaQuery.of(context).size.width * 0.15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    ChatModelSingle itemChat = widget.store.chats![index];

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                listMessages: list,
                                chatEntity: ChatEntity.singleChat,
                                singleChat: widget.store.chats![index],
                              ),
                            ));
                      },
                      child: ChatItemSingle(
                        chat: itemChat,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
