import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Alignment? alignment;
  final EdgeInsets? padding;
  final Widget? leading;
  final Widget? titleWidget;
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
      this.action,
      this.alignment,
      this.titleWidget,
      this.padding});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SafeArea(
      child: Column(
        children: [
          Padding(
              padding: padding ?? const EdgeInsets.symmetric(horizontal: 12),
              child: Stack(
                alignment: alignment ?? Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: leading ??
                        const Row(
                          children: [
                            CustomBackButton(),
                          ],
                        ),
                  ),
                  if (titleWidget != null)
                    Align(alignment: Alignment.center, child: titleWidget),
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
              isScrollable: true,
              controller: tabController,
              tabs: tabs!.map((e) => Tab(text: e)).toList(),
            )
          ]
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height ?? kToolbarHeight);
}
