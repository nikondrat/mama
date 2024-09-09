import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mama/src/data.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/feature/services/services_user/model/button_model.dart';

class ServicesUserView extends StatelessWidget {
  const ServicesUserView({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToMyRecordsView() {
      context.pushNamed(AppViews.servicesSleepMusicView);
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
                  Gap(16),

                  /// #knowledge center box
                  MainBox(
                    mainText: t.services.knowledgeCenter.title,
                    image: Assets.icons.icHat4x.path,
                  ),
                  Gap(8),

                  /// #online consultation box
                  MainBoxWithButtons(
                    image: Assets.icons.icChatVideo4x.path,
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
                    mainText: t.services.onlineConsultation.title,
                  ),
                  Gap(8),

                  /// #music for sleep box
                  MainBoxWithButtons(
                    image: Assets.icons.icMoonMusic4x.path,
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
                    mainText: t.services.sleepMusic.title,
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