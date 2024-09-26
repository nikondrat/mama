import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? height;
  final String? title;
  final Widget? action;

  final TabController? tabController;
  final List<String>? tabs;

  const CustomAppBar(
      {super.key,
      this.leading,
      this.title,
      this.height,
      this.tabs,
      this.tabController,
      this.action});

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
                    child: leading ??
                        Row(
                          children: [
                            CustomBackButton(),
                          ],
                        ),
                  ),
                  if (title != null)
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        title!,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: action ??
                        const SizedBox(
                          width: 40,
                          height: 40,
                        ),
                  ),
                ],
              )),
          if (tabs != null && tabController != null) ...[
            10.h,
            TabBar(
                controller: tabController,
                tabs: tabs!.map((e) => Tab(text: e)).toList())
          ]
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
