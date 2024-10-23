import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class _Item {
  final String title;
  final String iconPath;
  final String iconPathTap;
  _Item({
    required this.title,
    required this.iconPath,
    required this.iconPathTap,
  });
}

class BottomBar extends StatefulWidget {
  final TabController tabController;
  final bool isUser;
  const BottomBar({
    super.key,
    required this.isUser,
    required this.tabController,
  });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    widget.tabController.animateTo(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  late List<_Item> items = [
    _Item(
      title: t.profile.bottomBarHome,
      iconPath: Assets.icons.icBnHome.path,
      iconPathTap: Assets.icons.icBnHomeTap.path,
    ),
    if (widget.isUser)
      _Item(
        title: t.profile.bottomBarDiaries,
        iconPath: Assets.icons.icBnDiary.path,
        iconPathTap: Assets.icons.icBnDiary.path,
      ),
    _Item(
      title: t.profile.bottomBarChats,
      iconPath: Assets.icons.icBnChats.path,
      iconPathTap: Assets.icons.icBnChatsTap.path,
    ),
    _Item(
      title: t.profile.bottomBarServices,
      iconPath: Assets.icons.icBnServices.path,
      iconPathTap: Assets.icons.icBnServicesTap.path,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 84,
          color: AppColors.lightPirple,
        ),
        Positioned(
          bottom: 15,
          child: SizedBox(
            height: 90,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: items.map((e) {
                  final int index = items.indexOf(e);
                  return _ItemWidget(
                      item: items[index],
                      index: index,
                      selectedIndex: _selectedIndex,
                      onItemTapped: _onItemTapped);
                }).toList()),
          ),
        )
      ],
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final _Item item;
  final int index;
  final int selectedIndex;
  final Function(int) onItemTapped;
  const _ItemWidget({
    required this.item,
    required this.index,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4.5,
        child: selectedIndex != index
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 28,
                    item.iconPath,
                  ),
                  Text(
                    item.title,
                    style: textTheme.labelSmall,
                  ),
                ],
              )
            : SizedBox(
                height: 62,
                width: 88,
                child: Card(
                  color: AppColors.whiteColor,
                  shadowColor: AppColors.skyBlue,
                  elevation: 1,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 28,
                        item.iconPathTap,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        item.title,
                        style: textTheme.labelSmall!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
