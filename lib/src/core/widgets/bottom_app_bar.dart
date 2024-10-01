import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class BottomBar extends StatefulWidget {
  final TabController tabController;
  const BottomBar({
    super.key,
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
              children: [
                barItem(t.profile.bottomBarHome, Assets.icons.icBnHome.path,
                    Assets.icons.icBnHomeTap.path, 0),
                barItem(t.profile.bottomBarDiaries, Assets.icons.icBnDiary.path,
                    Assets.icons.icBnDiary.path, 1),
                barItem(t.profile.bottomBarChats, Assets.icons.icBnChats.path,
                    Assets.icons.icBnChatsTap.path, 2),
                barItem(
                    t.profile.bottomBarServices,
                    Assets.icons.icBnServices.path,
                    Assets.icons.icBnServicesTap.path,
                    3),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget barItem(String text, String iconPath, String iconPatTap, int index) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 4.5,
        child: _selectedIndex != index
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    height: 28,
                    iconPath,
                  ),
                  Text(
                    text,
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
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        height: 28,
                        iconPatTap,
                        color: AppColors.primaryColor,
                      ),
                      Text(
                        text,
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
