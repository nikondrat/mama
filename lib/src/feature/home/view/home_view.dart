import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  static const List<Color> _colors = [
    AppColors.lightBlue,
    AppColors.lightBlue,
    AppColors.purpleLighterBackgroundColor,
    AppColors.lightBlue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _colors[_selectedIndex],
      appBar: CustomAppBar(
        leading: ProfileWidget(
          onTap: () {
            context.pushNamed(AppViews.profile);
          },
          alignment: Alignment.centerLeft,
          avatarUrl:
              'https://i.pinimg.com/564x/49/3c/e7/493ce760bc067f2530d73365ace0d66c.jpg',
        ),
        action: ProfileWidget(
          isShowText: true,
          childrenAvatars: [
            'https://i.pinimg.com/564x/63/c3/99/63c399373f8afa96dfb36eb6a1874a2c.jpg',
            'https://i.pinimg.com/564x/33/08/35/33083558f59dadc6ab278d974703ad87.jpg'
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeBodyWidget(),
          TrackersView(),
          ChatsScreen(),
          ServicesUserView(),
        ],
      ),
      bottomNavigationBar: BottomBar(
        tabController: _tabController,
      ),
    );
  }
}
