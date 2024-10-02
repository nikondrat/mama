import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'last_message.g.dart';

@JsonSerializable()
class LastMessage extends _LastMessage with _$LastMessage {
  @JsonKey(name: 'chat_id')
  final String chatId;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  LastMessage({
    required this.chatId,
    this.createdAt,
    required super.id,
    required super.nikName,
    required super.senderId,
    required super.text,
    super.filePath,
    super.filenName,
    super.readAt,
    super.reply,
    super.typeFile,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) =>
      _$LastMessageFromJson(json);

  Map<String, dynamic> toJson() => _$LastMessageToJson(this);
}

abstract class _LastMessage with Store {
  _LastMessage({
    this.filePath,
    this.filenName,
    required this.id,
    required this.nikName,
    this.readAt,
    this.reply,
    required this.senderId,
    required this.text,
    this.typeFile,
  });

  @observable
  @JsonKey(name: 'file_path')
  String? filePath;

  @observable
  @JsonKey(name: 'filename')
  String? filenName;

  @observable
  @JsonKey(name: 'id')
  String id;

  @action
  setId(String value) => id = value;

  @observable
  @JsonKey(name: 'nik_name')
  String nikName;

  @action
  setNikName(String value) => nikName = value;

  @observable
  @JsonKey(name: 'read_at')
  String? readAt;

  @action
  setReadAt(String? value) => readAt = value;

  @observable
  @JsonKey(name: 'reply')
  String? reply;

  @action
  setReply(String? value) => reply = value;

  @observable
  @JsonKey(name: 'sender_id')
  String senderId;

  @action
  setSenderId(String value) => senderId = value;

  @observable
  @JsonKey(name: 'text')
  String text;

  @action
  setText(String value) => text = value;

  @observable
  @JsonKey(name: 'type_file')
  String? typeFile;

  @action
  setTypeFile(String? value) => typeFile = value;
}
