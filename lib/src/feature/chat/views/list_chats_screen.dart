import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

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
    return Provider(
      create: (context) => ChatsViewStore(
          restClient: context.read<Dependencies>().restClient,
          userStore: context.read<UserStore>()),
      builder: (context, _) {
        final store = context.watch<ChatsViewStore>();

        return Scaffold(
          backgroundColor: AppColors.purpleLighterBackgroundColor,
          appBar: widget.appBar,
          body: ChatsBodyWidget(store: store),
        );
      },
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
        nickname: 'Марина',
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
        avatar: Assets.images.imgPerson2.path,
        groupChat: 'groupChat',
        id: 'id',
        name: 'Sos Поддержка'),
    id: 'id',
    lastMessage: LastMessage(
        chatId: '0',
        id: '0',
        nickname: 'Марина',
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
