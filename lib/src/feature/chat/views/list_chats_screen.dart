// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

import '../../../core/widgets/custom_toggle_button.dart';

class ChatsListScreen extends StatefulWidget {
  final CustomAppBar appBar;
  const ChatsListScreen({
    super.key,
    required this.appBar,
  });

  @override
  State<ChatsListScreen> createState() => _ChatsListScreenState();
}

class _ChatsListScreenState extends State<ChatsListScreen> {
  var toogleSelected = 0;
  List<ChatModelSingle> sortdlistSingle = [];

  @override
  void initState() {
    sortdlistSingle = List.from(listChatSingle);
    super.initState();
  }

  void filterSingle() {
    sortdlistSingle = toogleSelected == 1
        ? listChatSingle.where((item) {
            return item.participant1.profession != null;
          }).toList()
        : listChatSingle;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return Scaffold(
      backgroundColor: AppColors.purpleLighterBackgroundColor,
      appBar: widget.appBar,
      body: ListView(
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
                    itemCount: 4,
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
                                  groupChat: listChatGroup[0],
                                  listMessages: listGroup,
                                  chatEntity: ChatEntity.groupChat,
                                ),
                              ));
                        },
                        child: ChatItemGroup(
                          chat: listChatGroup[0],
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
                      setState(() {
                        toogleSelected = index;
                        filterSingle();
                      });
                    },
                    btnWidth: MediaQuery.of(context).size.width / 2.3,
                    btnHeight: 38,
                  ),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sortdlistSingle.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    indent: MediaQuery.of(context).size.width * 0.15,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    ChatModelSingle itemChat = sortdlistSingle[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatScreen(
                                listMessages: list,
                                chatEntity: ChatEntity.singleChat,
                                singleChat: sortdlistSingle[index],
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

List<MessageModel> list = [
  MessageModel(
    text:
        'Добрый день! Меня зовут Кристина. Я хотела бы заказать у вас консультацию.',
    isSender: true,
    time: DateTime.now(),
  ),
  MessageModel(
    isSender: false,
    text: 'Добрый день, Кристина!',
    time: DateTime.now(),
    avatarParticipant: Assets.images.imgPerson1.path,
  ),
  MessageModel(
    isSender: false,
    text: 'В прошлый раз я успела на вопросики, а тут совсем некогда',
    time: DateTime.now(),
    replyItem: ReplyItem('Варвара Акиншина',
        'Расскажите, сколько яблоков безопасно давать в год и 1 месяц? Мой может целое яблоко за час умять, это норм?'),
    avatarParticipant: Assets.images.imgPerson1.path,
  )
];
List<MessageModel> listGroup = [
  MessageModel(
    text: 'В прошлый раз я успела на вопросики, а тут совсем некогда 💅💅💅',
    isSender: true,
    time: DateTime.now(),
  ),
  MessageModel(
    isSender: false,
    text:
        'Если нет аллергии и не портится стул, всё нормально. Чтобы снизить риски, давайте яблоко без кожуры или в виде яблочной пюрешки.',
    nameReciever: 'Жанна Коршунова',
    replyItem: ReplyItem('Варвара Акиншина',
        'Расскажите, сколько яблоков безопасно давать в год и 1 месяц? Мой может целое яблоко за час умять, это норм?'),
    profession: 'Акушер',
    avatarParticipant: Assets.images.imgPerson1.path,
    time: DateTime.now(),
  )
];

List<ChatModelSingle> listChatSingle = [
  ChatModelSingle(
    lastMessage: LastMessage(
        filePath: 'kjhg',
        chatId: '0',
        id: '0',
        nikName: 'Марина',
        senderId: '234',
        text: 'В прошлый раз я успела на вопросики, а тут совсем некогда'),
    createdAt: DateTime.now(),
    lastMessageAt: DateTime.now(),
    participant1Unread: 10,
    participant2Unread: 15,
    participant1: PartisipantModel(
      firstName: 'Марина',
      secondName: 'Евгеньева',
      createdAt: DateTime.now(),
      avatarUrl: Assets.images.imgProfile.path,
      email: 'email',
      // profession: 'Педиатр',
      id: '234',
      gender: 'female',
      phone: '89034567833',
      updatedAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
      state: 'state',
      status: 'status',
    ),
    participant2: PartisipantModel(
      firstName: 'Марина',
      secondName: 'Евгеньева',
      createdAt: DateTime.now(),
      phone: '89034567833',
      id: '234',
      gender: 'female',
      avatarUrl: Assets.images.imgPerson2.path,
      email: 'email',
      updatedAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
      state: 'state',
      status: 'status',
    ),
    id: '0',
    participant1Id: 'participant1Id',
    participant2Id: 'participant2Id',
  )
];

List<ChatModelGroup> listChatGroup = [
  ChatModelGroup(
    createdAt: DateTime.now(),
    lastMessageAt: DateTime.now(),
    updatedAt: DateTime.now(),
    unreadMessages: 3,
    idGroupChat: 'idGroupChat',
    idParticipant: 'idParticipant',
    groupChatInfo: GroupChatInfo(
        Assets.images.imgPerson2.path, 'groupChat', 'id', 'Sos Поддержка'),
    id: 'id',
    lastMessage: LastMessage(
        chatId: '0',
        id: '0',
        nikName: 'Марина',
        senderId: '234',
        text: 'В прошлый раз я успела на вопросики, а тут совсем некогда'),
    participant: PartisipantModel(
      firstName: 'Марина',
      secondName: 'Евгеньева',
      createdAt: DateTime.now(),
      avatarUrl: Assets.images.imgProfile.path,
      email: 'email',
      profession: 'Педиатр',
      id: '234',
      gender: 'female',
      phone: '89034567833',
      updatedAt: DateTime.now(),
      lastActiveAt: DateTime.now(),
      state: 'state',
      status: 'status',
    ),
  )
];
