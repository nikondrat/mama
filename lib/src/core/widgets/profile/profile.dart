import 'package:flutter/material.dart';

import 'profile_switch.dart';

class ProfileWidget extends StatelessWidget {
  final String? avatarUrl;
  final List<String>? childrenAvatars;
  final Alignment alignment;
  final bool isShowText;

  final Function()? onTap;

  const ProfileWidget({
    super.key,
    this.alignment = Alignment.centerRight,
    this.avatarUrl,
    this.childrenAvatars,
    this.onTap,
    this.isShowText = false,
  });

  @override
  Widget build(BuildContext context) {
    if (childrenAvatars != null) {
      return ProfileSwitch(
        avatarsUrl: childrenAvatars!,
        alignment: alignment,
        isShowText: isShowText,
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 25,
        backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
        child: avatarUrl == null
            ? const Center(
                child: Icon(Icons.people),
              )
            : null,
      ),
    );
  }
}
