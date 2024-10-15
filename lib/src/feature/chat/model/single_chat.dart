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
  final DateTime createdAt;

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

  ChatModelSingle({
    super.lastMessage,
    super.lastMessageAt,
    super.participant1Unread,
    super.participant2Unread,
    required this.createdAt,
    required this.participant1,
    required this.participant2,
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
  _ChatModelSingle({
    this.lastMessage,
    this.lastMessageAt,
    this.participant1Unread,
    this.participant2Unread,
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
  setLlastMessageAt(DateTime value) => lastMessageAt = value;

  @observable
  @JsonKey(name: 'participant1_unread', fromJson: _countFromJson)
  int? participant1Unread;

  @action
  setParticipant1Unread(int value) => participant1Unread = value;

  @observable
  @JsonKey(name: 'participant2_unread', fromJson: _countFromJson)
  int? participant2Unread;

  @action
  setParticipant2Unread(int value) => participant2Unread = value;

  static int? _countFromJson(String value) {
    return int.tryParse(value);
  }
}
