// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/model/model.dart';
import 'package:mama/src/feature/chat/widgets/widgets.dart';

class GroupChatScreen extends StatefulWidget {
  final List<MessageModel> listMessages;
  final ChatEntity chatEntity;
  final ChatModelSingle? singleChat;
  final ChatModelGroup? groupChat;
  const GroupChatScreen({
    super.key,
    required this.listMessages,
    required this.chatEntity,
    this.singleChat,
    this.groupChat,
  });

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  late FormGroup formGroup;

  @override
  void initState() {
    formGroup = FormGroup({
      'message': FormControl<String>(
          // value: widget.model.firstName,
          ),
    });
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  void saveItem(ReplyItemWidget item) {
    ReplyItemWidget _replyItem = item;
    replyItem.add(_replyItem);
  }

  void clearList() {
    replyItem.clear();
  }

  List<ReplyItemWidget> replyItem = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPirple,
      appBar: ChatsAppBar(
        title: widget.groupChat != null
            ? widget.groupChat!.groupChatInfo.name
            : '${widget.singleChat!.participant1.firstName} ${widget.singleChat!.participant1.secondName}',
// тут для групп чата нужно сколько специалистов, этой инфо в модели нет
        subTitle: widget.groupChat != null
            ? widget.groupChat!.participant.firstName
            : '${t.chat.lastSeen} ${DateFormat('kk:mm').format(widget.singleChat!.participant1.lastActiveAt!)}',
        profession: widget.groupChat != null
            ? null
            : widget.singleChat!.participant1.profession,
        avatarUrl: widget.groupChat != null
            ? widget.groupChat!.groupChatInfo.avatar
            : widget.singleChat!.participant1.avatarUrl,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration:
                BoxDecoration(color: AppColors.purpleLighterBackgroundColor),
            child: ListView.builder(
              itemCount: widget.listMessages.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 10, bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Expanded(
                  child: MessageItemWidget(
                    chatEntity: widget.chatEntity,
                    message: MessageModel(
                      isSender: widget.listMessages[index].isSender,
                      text: widget.listMessages[index].text,
                      nameReciever: widget.listMessages[index].nameReciever,
                      profession: widget.listMessages[index].profession,
                      time: widget.listMessages[index].time,
                      avatarParticipant:
                          widget.listMessages[index].avatarParticipant,
                      replyItem: widget.listMessages[index].replyItem,
                      onTapReply: () {
                        setState(() {
                          saveItem(ReplyItemWidget(
                            replyItem: ReplyItem(
                                widget.listMessages[index].nameReciever
                                    .toString(),
                                widget.listMessages[index].text),
                          ));
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (replyItem.isNotEmpty)
                  ReplyItemWidget(
                      onTapClose: () {
                        setState(() {
                          clearList();
                        });
                      },
                      replyItem: replyItem[0].replyItem),
                Container(
                  decoration: BoxDecoration(color: AppColors.lightPirple),
                  child: SafeArea(
                      child: ReactiveForm(
                          formGroup: formGroup,
                          child: MessageInput(formControllName: 'message'))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
