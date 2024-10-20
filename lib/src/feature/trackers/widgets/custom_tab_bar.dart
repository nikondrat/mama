import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';

class CustomTabBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: 'Вес'),
        Tab(text: 'Рост'),
        Tab(text: 'Голова'),
        Tab(text: 'Таблица'),
      ],
      dividerColor: AppColors.whiteColor,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 3,
      indicatorColor: AppColors.whiteColor,
      labelColor: AppColors.primaryColor,
    );
  }

  @override
  Size get preferredSize => const Size(100, 100);
}
