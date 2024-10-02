import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/feature/chat/model/model.dart';
import 'package:mobx/mobx.dart';

part 'group_chat_model.g.dart';

@JsonSerializable()
class ChatModelGroup extends _ChatModelGroup with _$ChatModelGroup {
  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'can_delete')
  bool canDelete = true;

    @JsonKey(name: 'is_deleted')
  bool isDeleted = true;

  ChatModelGroup(
    super.lastMessage,
    super.lastMessageAt,
    this.createdAt,{
    required this.id,
    this.isDeleted = true,

  });

  factory ChatModelGroup.fromJson(Map<String, dynamic> json) =>
      _$ChatModelGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelGroupToJson(this);
}

abstract class _ChatModelGroup with Store {
  _ChatModelGroup(
    this.lastMessage,
    this.lastMessageAt,
  );

  @observable
  @JsonKey(name: 'last_message')
  LastMessage? lastMessage;

  @action
  setLastMessage(LastMessage? value) => lastMessage = value;

  @observable
  @JsonKey(name: 'last_message_at')
  String? lastMessageAt;

  @action
  setLastMessageAt(String value) => lastMessageAt = value;

  @observable
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @action
  setupdatedAt(String value) => updatedAt = value;

  @observable
  @JsonKey(name: 'unread_messages')
  int? unreadMessages;

  @action
  setUnreadMessages(int value) => unreadMessages = value;
}

@JsonSerializable()

class GroupChatInfo extends _GroupChatInfo with _$GroupChatInfo{
  GroupChatInfo(this.avatar, this.groupChat, this.id, this.name);
  @JsonKey(name: 'avatar')
  final String avatar;

  @JsonKey(name: 'group_chat')
  final String groupChat;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;


  factory GroupChatInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupChatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GroupChatInfoToJson(this);
}
abstract class _GroupChatInfo with Store {
}