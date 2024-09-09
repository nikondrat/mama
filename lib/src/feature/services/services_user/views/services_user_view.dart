import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:mama/src/feature/services/services_user/model/button_model.dart';
import 'package:mama/src/feature/services/services_user/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class ServicesUserView extends StatelessWidget {
  const ServicesUserView({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMyRecordsView() {
      context.go('/services-user-view/services-sleep-music-view');
    }

    return Scaffold(
      body: SafeArea(
        child: AppBody(
          builder: (width, size) {
            return Padding(
              padding: HorizontalSpacing.centered(width),
              child: ListView(
                children: [
                  /// #some space
                  SizedBox(height: 16),

                  /// #knowledge center box
                  MainBox(
                    mainText: t.services.knowledgeCenter.title,
                    image: Assets.icons.icHat4x.path,
                  ),
                  SizedBox(height: 8),

                  /// #online consultation box
                  MainBoxWithButtons(
                    image: Assets.icons.icChatVideo4x.path,
                    mainText: t.services.onlineConsultation.title,
                    buttons: [
                      ButtonModel(
                        title: t.services.myRecords.title,
                        onTap: navigateToMyRecordsView,
                      ),
                      ButtonModel(
                        title: t.services.specialists.title,
                        onTap: () {},
                      ),
                      ButtonModel(
                        title: t.services.onlineSchools.title,
                        onTap: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 8),

                  /// #music for sleep box
                  MainBoxWithButtons(
                    image: Assets.icons.icMoonMusic4x.path,
                    mainText: t.services.sleepMusic.title,
                    buttons: [
                      ButtonModel(
                        title: t.services.music.title,
                        onTap: () {},
                      ),
                      ButtonModel(
                        title: t.services.whiteNoise.title,
                        onTap: () {},
                      ),
                      ButtonModel(
                        title: t.services.fairyTales.title,
                        onTap: () {},
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
