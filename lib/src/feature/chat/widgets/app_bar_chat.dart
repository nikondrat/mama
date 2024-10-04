import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/chat/chat.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;
  final String title;
  final String subTitle;
  final String? profession;
  final String? avatarUrl;
  final Widget? action;

  final TabController? tabController;
  final List<String>? tabs;

  const ChatsAppBar({
    super.key,
    required this.title,
    this.height,
    this.tabs,
    this.tabController,
    this.action,
    required this.subTitle,
    this.avatarUrl,
    this.profession,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: SvgPicture.asset(
                            Assets.icons.icArrowLeftFilled,
                            width: 12,
                            height: 20,
                          ),
                        ),
                        16.w,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            profession != null
                                ? Row(
                                    children: [
                                      Text(
                                        title,
                                        style: textTheme.bodyMedium,
                                      ),
                                      3.w,
                                      if (profession != null)
                                        ProfessionBox(profession: profession!)
                                    ],
                                  )
                                : Text(
                                    title,
                                    style: textTheme.bodyMedium,
                                  ),
                            Text(
                              subTitle,
                              style: textTheme.labelSmall,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            height: 28,
                            Assets.icons.magnifier.path,
                          ),
                          8.w,
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: AssetImage(
                              avatarUrl!,
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
