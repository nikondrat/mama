import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_medic_card.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_service_info_screen_widgets.dart';
import 'package:mama/src/feature/services/utils/text_helper.dart';

class ServiceInfoScreen extends StatelessWidget {
  const ServiceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        action: SizedBox(
          height: 46,
          width: MediaQuery.of(context).size.width * 0.4,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColors.lightPirple,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                bottomLeft: Radius.circular(24),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  t.services.toSave.title,
                  style: TextStyle(
                    fontFamily: Assets.fonts.sFProTextMedium,
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(Assets.images.save.path),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AppBody(
            builder: (windowWidth, windowSize) => ListView(
              padding: HorizontalSpacing.centered(windowWidth),
              children: [
                SizedBox(height: 10),
                InkWell(
                  splashFactory: NoSplash.splashFactory,
                  onTap: () {},
                  child: MedicCard(),
                ),
                SizedBox(height: 10),
                Text(
                  t.services.childDevelopment.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 246,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(Assets.images.imgMomOne4x.path),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childDevDescription,
                ),
                SizedBox(height: 10),
                Text(
                  'Физическое развитие ребенка в 6 месяцев',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childPhysDescription,
                ),
                SizedBox(height: 10),
                Text(
                  'Что умеет ребенок в 6 месяцев',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Зрение',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childVision,
                ),
                SizedBox(height: 10),
                Text(
                  'Слух',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childVision,
                ),
                SizedBox(height: 10),
                Text(
                  'Речь',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childSpeech,
                ),
                SizedBox(height: 10),
                Text(
                  'Моторика',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childMotoric,
                ),
                SizedBox(height: 10),
                Text(
                  'Эмоции',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childEmotion,
                ),
                SizedBox(height: 10),
                Text(
                  'Игра',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childGame,
                ),
                SizedBox(height: 10),
                Container(
                  height: 144,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage(Assets.images.baby.path),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Режим дня в 6 месяцев',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childRegimen,
                ),
                SizedBox(height: 10),
                SizedBox(height: 10),
                Text(
                  'Режим сна',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  child: TextHelper.childSleep,
                ),
                SizedBox(height: 10),
                CommonHorizontalWidget(
                  mainTittle: 'Развитие ребенка в 6 месяцев',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
