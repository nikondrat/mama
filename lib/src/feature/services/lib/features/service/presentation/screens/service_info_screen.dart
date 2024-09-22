import 'package:flutter/material.dart';
import 'package:mama_and_co/features/service/presentation/widgets/common_service_info_screen_widgets.dart';
import 'package:mama_and_co/internals/text_helper.dart';

class ServiceInfoScreen extends StatelessWidget {
  const ServiceInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Центр знаний',
          style: TextStyle(
            color: Color(0xff4D4DE8),
          ),
        ),
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios_new),
            ),
            // Text('Назад'),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/save.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            InkWell(
              onTap: () {},
              child: MedicCard(),
            ),
            SizedBox(height: 10),
            Text(
              'Развитие ребенка в 6 месяцев',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 246,
              width: 358,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/images/image.png'),
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
                  image: AssetImage('assets/images/baby.png'),
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
    );
  }
}

class CommonHorizontalWidget extends StatelessWidget {
  final String mainTittle;
  const CommonHorizontalWidget({
    super.key,
    required this.mainTittle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 212,
      width: 164,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 164,
            width: 164,
            decoration: BoxDecoration(
              color: Color(0xffF0F2F7),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/img_2.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          width: 59,
                          height: 14,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            '6 месяцев',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  child: Text(
                    mainTittle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 15);
        },
      ),
    );
  }
}
