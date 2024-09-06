import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:template/src/data.dart';
import 'package:template/src/feature/services/services_user/widgets/main_box.dart';
import 'package:template/src/feature/services/services_user/widgets/main_box_with_buttons.dart';

class ServicesUserView extends StatelessWidget {
  const ServicesUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              /// #some space
              SizedBox(height: 16),

              /// #knowledge center box
              MainBox(
                mainText: t.services.knowledgeCenter.title,
                image: Assets.icons.icHat,
              ),
              SizedBox(height: 8),

              /// #online consultation box
              MainBoxWithButtons(
                image: Assets.icons.icChatVideo,
                mainText: t.services.onlineConsultation.title,
                firstButtonText: t.services.myRecords.title,
                secondButtonText: t.services.specialists.title,
                thirdButtonText: t.services.onlineSchools.title,
              ),
              SizedBox(height: 8),

              /// #music for sleep box
              MainBoxWithButtons(
                image: Assets.icons.icMoonMusic,
                mainText: t.services.musicForSleep.title,
                firstButtonText: t.services.music.title,
                secondButtonText: t.services.whiteNoise.title,
                thirdButtonText: t.services.fairyTales.title,
              ),

              SvgPicture.asset(Assets.icons.icMoonMusic),
            ],
          ),
        ),
      ),
    );
  }
}
