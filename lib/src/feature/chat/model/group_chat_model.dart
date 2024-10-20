import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/feature/chat/model/model.dart';
import 'package:mobx/mobx.dart';

part 'group_chat_model.g.dart';

@JsonSerializable()
class ChatModelGroup extends _ChatModelGroup with _$ChatModelGroup {
  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'can_delete')
  final bool canDelete;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'group_chat')
  final GroupChatInfo groupChatInfo;

  @JsonKey(name: 'id_group_chat')
  final String idGroupChat;

  @JsonKey(name: 'id_participant')
  final String idParticipant;

  @JsonKey(name: 'is_write')
  final bool isWrite;

  @JsonKey(name: 'participant')
  final PartisipantModel participant;

  ChatModelGroup({
    super.lastMessage,
    super.lastMessageAt,
    super.updatedAt,
    super.unreadMessages,
    required this.createdAt,
    required this.idGroupChat,
    required this.idParticipant,
    required this.participant,
    required this.groupChatInfo,
    required this.id,
    this.canDelete = true,
    this.isWrite = true,
    this.isDeleted = true,
  });

  factory ChatModelGroup.fromJson(Map<String, dynamic> json) =>
      _$ChatModelGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelGroupToJson(this);
}

abstract class _ChatModelGroup with Store {
  _ChatModelGroup({
    this.lastMessage,
    this.lastMessageAt,
    this.updatedAt,
    this.unreadMessages,
  });

  @observable
  @JsonKey(name: 'last_message')
  LastMessage? lastMessage;

  @action
  setLastMessage(LastMessage? value) => lastMessage = value;

  @observable
  @JsonKey(name: 'last_message_at')
  DateTime? lastMessageAt;

  @action
  setLastMessageAt(DateTime value) => lastMessageAt = value;

  @observable
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @action
  setupdatedAt(DateTime value) => updatedAt = value;

  @observable
  @JsonKey(name: 'unread_messages')
  int? unreadMessages;

  @action
  setUnreadMessages(int value) => unreadMessages = value;
}

@JsonSerializable()
class GroupChatInfo extends _GroupChatInfo with _$GroupChatInfo {
  GroupChatInfo({this.avatar, this.groupChat, this.id, this.name});
  @JsonKey(name: 'avatar')
  final String? avatar;

  @JsonKey(name: 'group_chat')
  final String? groupChat;

  @JsonKey(name: 'id')
  final String? id;

  @JsonKey(name: 'name')
  final String? name;

  factory GroupChatInfo.fromJson(Map<String, dynamic> json) =>
      _$GroupChatInfoFromJson(json);

  Map<String, dynamic> toJson() => _$GroupChatInfoToJson(this);
}

abstract class _GroupChatInfo with Store {}
