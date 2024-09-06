import 'package:flutter/material.dart';
import 'package:template/src/data.dart';
import 'package:template/src/feature/services/services_user/widgets/widgets.dart';

class ServicesUserView extends StatelessWidget {
  const ServicesUserView({super.key});

  @override
  Widget build(BuildContext context) {
    // void navigateToMyRecordsView() {
    //   context.go('/services-consulting-view');
    // }

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
                    firstButtonText: t.services.myRecords.title,
                    secondButtonText: t.services.specialists.title,
                    thirdButtonText: t.services.onlineSchools.title,
                    onTapFirstButton: () {},
                    onTapSecondButton: () {},
                    onTapThirdButton: () {},
                  ),
                  SizedBox(height: 8),

                  /// #music for sleep box
                  MainBoxWithButtons(
                    image: Assets.icons.icMoonMusic4x.path,
                    mainText: t.services.sleepMusic.title,
                    firstButtonText: t.services.music.title,
                    secondButtonText: t.services.whiteNoise.title,
                    thirdButtonText: t.services.fairyTales.title,
                    onTapFirstButton: () {},
                    onTapSecondButton: () {},
                    onTapThirdButton: () {},
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
