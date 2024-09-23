import 'package:flutter/material.dart';
import 'package:mama/src/core/constant/constant.dart';
import 'package:mama/src/feature/trackers/views/views.dart';
import 'package:mama/src/feature/trackers/widgets/fl_chart.dart';
import 'package:mama/src/feature/trackers/widgets/widgets.dart';

class Weight extends StatelessWidget {
  const Weight({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// To Know More Contaner
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ToKnowMoreContainer(),
            ),

            /// Current and Dynamic Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CurrentAndDymanicContainer(),
            ),

            /// KG Or gramm Container
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 5, top: 16),
              child: Row(
                children: [
                  SwitchContainer(title1: 'КГ', title2: 'Г'),
                ],
              ),
            ),

            /// Grafic
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 278,
                child: FlProgressChart(),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  KnowMoreButton(
                    onTap: () {},
                  ),
                  SizedBox(width: 8),
                  AddButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddWeight(),
                          ));
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// Stories
            Center(
              child: Text(
                'История',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SwitchContainer(
                    title1: 'Новые',
                    title2: 'Старые',
                    // isTrue: false,
                  ),
                  SwitchContainer(title1: 'КГ', title2: 'Г'),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RowStroriesData(
                data: 'Дата',
                week: 'Неделя',
                weight: 'Вес',
                style: AppTextStyles.f10w700.copyWith(
                  color: AppColors.greyBrighterColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RowStroriesData(
                      data: '01 сентября',
                      week: '17',
                      weight: '6,25',
                      style: AppTextStyles.f17w400,
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
