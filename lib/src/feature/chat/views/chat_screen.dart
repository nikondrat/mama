// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/feature/chat/chat.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:mama/src/core/core.dart';

class ChatScreen extends StatefulWidget {
  final List<MessageModel> listMessages;
  final ChatEntity chatEntity;
  final ChatModelSingle? singleChat;
  final ChatModelGroup? groupChat;
  const ChatScreen({
    super.key,
    required this.listMessages,
    required this.chatEntity,
    this.singleChat,
    this.groupChat,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late FormGroup formGroup;
  bool _isSearching = false;
  List<MessageModel> sortedlistMessages = [];
  bool _emojiShowing = false;
  final _controller = TextEditingController();
  List<PlatformFile> files = [];
  FilePickerResult? result;

  @override
  void initState() {
    formGroup = FormGroup({
      'message': FormControl<String>(
        // value: widget.model.firstName,
      ),
      'search': FormControl<String>(
        // value: widget.model.firstName,
      ),
    });
    sortedlistMessages = List.from(widget.listMessages);
    super.initState();
  }

  @override
  void dispose() {
    formGroup.dispose();
    super.dispose();
  }

  void saveItem(ReplyItemWidget item) {
    ReplyItemWidget reply = item;
    replyItem.add(reply);
  }

  void filterMessage() {
    sortedlistMessages = formGroup.control('search').isNotNull
        ? widget.listMessages.where((item) {
      return item.text
          .toLowerCase()
          .contains(formGroup.control('search').value.toLowerCase());
    }).toList()
        : widget.listMessages;
  }

  Future getAttach() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
    );

    if (result != null) {
      files = result!.files;
    } else {
      // User canceled the picker
    }

    setState(() {});
  }

  void clearList() {
    replyItem.clear();
  }

  List<ReplyItemWidget> replyItem = [];

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formGroup,
      child: Scaffold(
        backgroundColor: AppColors.lightPirple,
        appBar: _isSearching
            ? finder()
            : ChatsAppBar(
            title: widget.groupChat != null
                ? widget.groupChat!.groupChatInfo.name ?? ''
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
            onTapSearch: _startSearch,
            onTapAvatar: () {
              widget.chatEntity == ChatEntity.groupChat
                  ? Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GroupScreen(
                        groupChatInfo:
                        widget.groupChat!.groupChatInfo,
                      )))
                  : null;
            }),
        body: Stack(
          children: [
            Container(
              height: double.infinity,
              decoration: const BoxDecoration(
                  color: AppColors.purpleLighterBackgroundColor),
              child: ListView.builder(
                itemCount: sortedlistMessages.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Expanded(
                    child: MessageItemWidget(
                      onTapReply: () {
                        setState(() {
                          saveItem(ReplyItemWidget(
                            replyItem: ReplyItem(
                                sortedlistMessages[index]
                                    .nameReciever
                                    .toString(),
                                sortedlistMessages[index].text),
                          ));
                        });
                      },
                      chatEntity: widget.chatEntity,
                      message: sortedlistMessages[index],
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
                  Offstage(
                    offstage: !files.isNotEmpty,
                    child: AssetsWidget(
                      files: files,
                      onTapDelete: () {
                        setState(() {});
                      },
                    ),
                  ),
                  Container(
                    decoration:
                    const BoxDecoration(color: AppColors.lightPirple),
                    child: SafeArea(
                        child: ReactiveForm(
                            formGroup: formGroup,
                            child: MessageInput(
                                controller: _controller,
                                onTapAttach: getAttach,
                                onTapSmile: () {
                                  setState(() {
                                    _emojiShowing = !_emojiShowing;
                                  });
                                },
                                formControllName: 'message'))),
                  ),
                  Offstage(
                    offstage: !_emojiShowing,
                    child: EmojiWidget(
                      controller: _controller,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget finder() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Finder(
        hintText: t.chat.hintSearchChat,
        formControlName: 'search',
        onPressedClear: () {
          _stopSearching();
        },
        onChange: () {
          setState(() {
            filterMessage();
          });
        },
      ),
    );
  }

  void _startSearch() {
//!ToDo подсветить искомые слова
    setState(() {
      _isSearching = true;
    });
    filterMessage();
  }

  void _stopSearching() {
    setState(() {
      _isSearching = false;
      formGroup.control('search').updateValue(null);
    });
  }
}
