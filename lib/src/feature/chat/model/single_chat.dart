import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/feature/chat/model/model.dart';
import 'package:mobx/mobx.dart';

part 'single_chat.g.dart';

enum ChatEntity {
  @JsonValue('GroupChat')
  groupChat,
  @JsonValue('SingleChat')
  singleChat,
}

@JsonSerializable()
class ChatModelSingle extends _ChatModelSingle with _$ChatModelSingle {
  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'is_deleted')
  bool isDeleted = true;

  @JsonKey(name: 'participant1_id')
  final String participant1Id;

  @JsonKey(name: 'participant_1')
  final PartisipantModel participant1;

  @JsonKey(name: 'participant_2')
  final PartisipantModel participant2;

  @JsonKey(name: 'participant2_id')
  final String participant2Id;

  ChatModelSingle(
    super.lastMessage,
    super.lastMessageAt,
    this.createdAt,
    this.participant1,
    this.participant2, {
    required this.id,
    this.isDeleted = true,
    required this.participant1Id,
    required this.participant2Id,
  });

  factory ChatModelSingle.fromJson(Map<String, dynamic> json) =>
      _$ChatModelSingleFromJson(json);

  Map<String, dynamic> toJson() => _$ChatModelSingleToJson(this);
}

abstract class _ChatModelSingle with Store {
  _ChatModelSingle(
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
  setLlastMessageAt(String value) => lastMessageAt = value;

  @observable
  @JsonKey(name: 'participant1_unread')
  String? participant1Unread;

  @action
  setParticipant1Unread(String value) => participant1Unread = value;

  @observable
  @JsonKey(name: 'participant2_unread')
  String? participant2Unread;

  @action
  setParticipant2Unread(String value) => participant2Unread = value;
}
