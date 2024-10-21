import 'package:emoji_picker_flutter/emoji_picker_flutter.dart' as emoji;
import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:flutter/foundation.dart' as foundation;

class EmojiWidget extends StatelessWidget {
  final TextEditingController controller;
  const EmojiWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return emoji.EmojiPicker(
      textEditingController: controller,
      config: emoji.Config(
        height: 200,
        checkPlatformCompatibility: true,
        viewOrderConfig: const emoji.ViewOrderConfig(
          top: emoji.EmojiPickerItem.categoryBar,
          middle: emoji.EmojiPickerItem.emojiView,
          bottom: emoji.EmojiPickerItem.searchBar,
        ),
        emojiViewConfig: emoji.EmojiViewConfig(
          backgroundColor: AppColors.lightPirple,
          emojiSizeMax: 28 *
              (foundation.defaultTargetPlatform == TargetPlatform.iOS
                  ? 1.2
                  : 1.0),
        ),
        skinToneConfig: const emoji.SkinToneConfig(),
        categoryViewConfig: const emoji.CategoryViewConfig(
          backgroundColor: AppColors.lightPirple,
        ),
        bottomActionBarConfig:
        const emoji.BottomActionBarConfig(enabled: false),
        searchViewConfig: const emoji.SearchViewConfig(),
      ),
    );
  }
}
