import 'package:flutter/material.dart';
import 'package:mama/src/feature/chat/chat.dart';

class MessageModel {
  final bool isSender;

  final String text;
  final String? nameReciever;
  final ReplyItem? replyItem;
  final String? avatarParticipant;
  final VoidCallback? onTapReply;
  final String? profession;
  final DateTime? time;

  MessageModel({
    required this.isSender,
    required this.text,
    this.nameReciever,
    this.replyItem,
    this.avatarParticipant,
    this.onTapReply,
    this.profession,
    this.time,
  });
}
