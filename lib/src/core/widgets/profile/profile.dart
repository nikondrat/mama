import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

import 'profile_switch.dart';

class ProfileWidget extends StatelessWidget {
  final String? avatarUrl;
  final List<ChildModel?>? children;
  final Alignment alignment;
  final bool isShowText;

  final Function()? onTap;

  const ProfileWidget({
    super.key,
    this.alignment = Alignment.centerRight,
    this.avatarUrl,
    this.children,
    this.onTap,
    this.isShowText = false,
  });

  @override
  Widget build(BuildContext context) {
    if (children != null && children!.isNotEmpty) {
      if (children!.length >= 2) {
        return ProfileSwitch(
          userStore: context.watch(),
          children: children!,
          alignment: alignment,
          isShowText: isShowText,
        );
      } else if (children!.length == 1) {
        final ChildModel child = children!.first!;

        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isShowText)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(child.firstName),
              ),
            GestureDetector(
              onTap: onTap,
              child: _Avatar(avatarUrl: child.avatarUrl),
            ),
          ],
        );
      }
    } else if (avatarUrl != null) {
      return GestureDetector(
          onTap: onTap, child: _Avatar(avatarUrl: avatarUrl));
    }
    return const SizedBox.shrink();
  }
}

class _Avatar extends StatelessWidget {
  final String? avatarUrl;
  const _Avatar({
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 25,
      backgroundImage: avatarUrl != null ? NetworkImage(avatarUrl!) : null,
      child: avatarUrl == null || avatarUrl!.isEmpty
          ? const Center(
              child: Icon(Icons.account_circle_outlined),
            )
          : null,
    );
  }
}
