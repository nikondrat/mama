import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();

    return Observer(builder: (context) {
      return CustomAppBar(
        leading: ProfileWidget(
          onTap: () {
            router.pushNamed(AppViews.profile);
          },
          alignment: Alignment.centerLeft,
          avatarUrl: userStore.account.avatarUrl ?? '',
        ),
        action: ProfileWidget(
          isShowText: true,
          children: userStore.children.toList(),
        ),
      );
    });
  }
}
