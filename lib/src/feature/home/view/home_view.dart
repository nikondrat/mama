import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch<UserStore>();

    return Provider(
      create: (context) =>
          ArticleStore(restClient: context.read<Dependencies>().restClient),
      builder: (context, _) {
        return LoadHomeData(
            userStore: userStore, child: _Body(userStore: userStore));
      },
    );
  }
}

class _Body extends StatefulWidget {
  final UserStore userStore;
  const _Body({required this.userStore});

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool isUser = false;

  @override
  void initState() {
    super.initState();
    isUser = widget.userStore.account.role == Role.user;
    _tabController = TabController(length: isUser ? 4 : 3, vsync: this);
  }

  late final Widget leadingWidget = ProfileWidget(
    onTap: () {
      router.pushNamed(AppViews.profile);
    },
    alignment: Alignment.centerLeft,
    avatarUrl: widget.userStore.account.avatarUrl ?? '',
  );

  late CustomAppBar appBar = CustomAppBar(
    leading: ProfileWidget(
      onTap: () {
        router.pushNamed(AppViews.profile);
      },
      alignment: Alignment.centerLeft,
      avatarUrl: widget.userStore.account.avatarUrl ?? '',
    ),
    action: const ProfileWidget(
      isShowText: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeBodyWidget(
              appBar: CustomAppBar(
                leading: leadingWidget,
                action: switch (widget.userStore.role) {
                  Role.user => const ProfileWidget(
                      isShowText: true,
                    ),
                  Role.doctor => throw UnimplementedError(),
                  _ => null,
                },
                // action: widget.userStore.role,
              ),
            ),
            if (isUser)
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
          isUser: isUser,
          tabController: _tabController,
        ));
  }
}
