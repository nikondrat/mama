import 'package:flutter/material.dart';
import 'package:template/src/data.dart';
import 'package:template/src/feature/services/services_user/widgets/widgets.dart';

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
                image: 'assets/icons/img_hat_4x.png',
              ),
              SizedBox(height: 8),

              /// #online consultation box
              MainBoxWithButtons(
                image: 'assets/icons/img_chat_video_4x.png',
                mainText: t.services.onlineConsultation.title,
                firstButtonText: t.services.myRecords.title,
                secondButtonText: t.services.specialists.title,
                thirdButtonText: t.services.onlineSchools.title,
              ),
              SizedBox(height: 8),

              /// #music for sleep box
              MainBoxWithButtons(
                image: 'assets/icons/img_moon_music_4x.png',
                mainText: t.services.musicForSleep.title,
                firstButtonText: t.services.music.title,
                secondButtonText: t.services.whiteNoise.title,
                thirdButtonText: t.services.fairyTales.title,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
