import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';
import 'package:go_router/go_router.dart';

class ServicesUserView extends StatelessWidget {
  final CustomAppBar appBar;

  const ServicesUserView({
    super.key,
    required this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: AppBody(
          builder: (width, size) {
            return Padding(
              padding: HorizontalSpacing.centered(width),
              child: ListView(
                children: [
                  /// #some space
                  const SizedBox(height: 16),

                  /// #knowledge center box
                  InkWell(
                    highlightColor: Colors.transparent,
                    splashFactory: NoSplash.splashFactory,
                    onTap: () {
                      context.pushNamed(AppViews.serviceKnowlegde);
                    },
                    child: MainBox(
                      mainText: t.services.knowledgeCenter.title,
                      image: Assets.images.imgHat4x.path,
                    ),
                  ),
                  const SizedBox(height: 8),

                  /// #online consultation box
                  MainBoxWithButtons(
                    image: Assets.images.imgChatVideo4x.path,
                    mainText: t.services.onlineConsultation.title,
                    buttons: [
                      ButtonModel(
                        title: t.services.myRecords.title,
                        onTap: () {},
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
                  const SizedBox(height: 8),

                  /// #music for sleep box
                  MainBoxWithButtons(
                    image: Assets.images.imgMoonMusic4x.path,
                    mainText: t.services.sleepMusic.title,
                    onTap: () =>
                        context.pushNamed(AppViews.servicesSleepMusicView),
                    buttons: [
                      ButtonModel(
                        title: t.services.music.title,
                        onTap: () {
                          context.pushNamed(AppViews.servicesSleepMusicView);
                        },
                      ),
                      ButtonModel(
                        title: t.services.whiteNoise.title,
                        onTap: () {
                          context.pushNamed(AppViews.servicesSleepMusicView,
                              extra: {
                                'selectedTab': 1,
                              });
                        },
                      ),
                      ButtonModel(
                        title: t.services.fairyTales.title,
                        onTap: () {
                          context.pushNamed(AppViews.servicesSleepMusicView,
                              extra: {
                                'selectedTab': 2,
                              });
                        },
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
