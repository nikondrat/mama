import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'chats_data.g.dart';

@JsonSerializable()
class ChatsData {
  @JsonKey(name: 'chats')
  final List<ChatModelSingle>? chats;

  @JsonKey(name: 'group_chat')
  final List<ChatModelGroup>? groupChat;

  ChatsData({this.chats, this.groupChat});

  factory ChatsData.fromJson(Map<String, dynamic> json) =>
      _$ChatsDataFromJson(json);
  Map<String, dynamic> toJson() => _$ChatsDataToJson(this);
}
