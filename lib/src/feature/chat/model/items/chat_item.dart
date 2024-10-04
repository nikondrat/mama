class ChatItemModel {
  final String avatarUrl;
  final String name;
  final String? profession;
  final int? unreadMessages;
  final String? lastMessageName;
  final String? lastMessageText;
  final bool isAttach;

  ChatItemModel({
    required this.avatarUrl,
    required this.name,
    this.profession,
    this.unreadMessages,
    this.lastMessageName,
    this.lastMessageText,
    this.isAttach = false,
  });
}
