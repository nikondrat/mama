// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/chat/views/group_chat.dart';

class ChatsScreen extends StatefulWidget {
  final CustomAppBar appBar;
  // final MomInfo mom;
  const ChatsScreen({
    super.key,
    required this.appBar,
    // required this.mom,
  });

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: AppColors.purpleLighterBackgroundColor,
      body: ListView(
        children: [
          CardWithoutMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Группы',
                  textAlign: TextAlign.center,
                  style: textTheme.labelLarge!
                      .copyWith(color: AppColors.greyBrighterColor),
                ),
                8.h,
                Flexible(
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
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
                                builder: (context) => GroupChatScreen(
                                  singleChat: listChatSingle[0],
                                  listMessages: listGroup,
                                  chatEntity: ChatEntity.groupChat,
                                ),
                              ));
                        },
                        child: GroupChatItem(),
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
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
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
                              builder: (context) => GroupChatScreen(
                                listMessages: list,
                                chatEntity: ChatEntity.singleChat,
                                singleChat: listChatSingle[0],
                              ),
                            ));
                      },
                      child: ChatItem(),
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

MomInfo mom = MomInfo(
  'Кристина Константинова',
  '+7 996 997-06-24',
  null,
  null,
  Assets.images.imgProfile.path,
  [
    ChildModel(
        id: '',
        firstName: 'Виктория',
        secondName: '',
        avatarUrl: Assets.images.imgProfile.path),
    ChildModel(
        id: '',
        firstName: 'Андрей',
        secondName: '',
        avatarUrl: Assets.images.imgPerson1.path),
  ],
);

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
    LastMessage(
        chatId: '0',
        id: '0',
        nikName: 'Жанна Коршунова',
        senderId: '234',
        text: 'В прошлый раз я успела на вопросики, а тут совсем некогда'),
    '12:33',
    '16:55',
    PartisipantModel(
      avatarUrl: Assets.images.imgProfile.path,
      email: 'email',
      '01-01-1970 01:00',
      'state',
      'status',
      'updatedAt',
    ),
    PartisipantModel(
      avatarUrl: Assets.images.imgPerson2.path,
      email: 'email',
      '01-01-1970 13:44',
      'state',
      'status',
      'updatedAt',
    ),
    id: '0',
    participant1Id: 'participant1Id',
    participant2Id: 'participant2Id',
  )
];
