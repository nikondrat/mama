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

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch<UserStore>();

    return LoadHomeData(
      userStore: userStore,
      builder: (data) {
        CustomAppBar appBar = CustomAppBar(
          leading: ProfileWidget(
            onTap: () {
              router.pushNamed(AppViews.profile);
            },
            alignment: Alignment.centerLeft,
            avatarUrl: data.account?.avatarUrl ?? '',
            avatarUrl: userStore.account.avatarUrl ?? '',
          ),
          action: ProfileWidget(
            isShowText: true,
            children: userStore.children.toList(),
          ),
        );

        return Scaffold(
          body: TabBarView(
            controller: _tabController,
            children: [
              HomeBodyWidget(
                appBar: appBar,
              ),
              TrackersView(
                appBar: appBar,
              ),
              ChatsListScreen(
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
        );
      },
    );
  }
}
