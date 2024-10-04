import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  static CustomAppBar appBar = CustomAppBar(
    leading: ProfileWidget(
      onTap: () {
        router.pushNamed(AppViews.profile);
      },
      alignment: Alignment.centerLeft,
      avatarUrl:
          'https://i.pinimg.com/564x/49/3c/e7/493ce760bc067f2530d73365ace0d66c.jpg',
    ),
    action: const ProfileWidget(
      isShowText: true,
      childrenAvatars: [
        'https://i.pinimg.com/564x/63/c3/99/63c399373f8afa96dfb36eb6a1874a2c.jpg',
        'https://i.pinimg.com/564x/33/08/35/33083558f59dadc6ab278d974703ad87.jpg'
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return LoadHomeData(
      userStore: context.watch<UserStore>(),
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeBodyWidget(
              appBar: appBar,
            ),
            TrackersView(
              appBar: appBar,
            ),
            ChatsScreen(
              appBar: appBar,
            ),
            ServicesUserView(
              appBar: appBar,
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(
          tabController: _tabController,
        ),
      ),
    );
  }
}
