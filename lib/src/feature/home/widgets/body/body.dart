import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

import 'home_school_body.dart';
import 'home_specialist_body.dart';
import 'user_body.dart';

class HomeBodyWidget extends StatelessWidget {
  final CustomAppBar appBar;
  const HomeBodyWidget({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();
    final ArticleStore articleStore = context.watch();

    return Scaffold(
      appBar: appBar,
      body: Observer(builder: (_) {
        switch (userStore.role) {
          case Role.admin:
          case Role.user:
            return HomeUserBody(
              articleStore: articleStore,
              userStore: userStore,
            );
          case Role.moderator:
          case Role.doctor:
            return const HomeSpecialistBody();
          case Role.onlineSchool:
            return HomeSchoolBody(
              articleStore: articleStore,
              userStore: userStore,
            );
          default:
            return HomeUserBody(
              articleStore: articleStore,
              userStore: userStore,
            );
        }
      }),
    );
  }
}
