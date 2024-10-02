import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

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
                  SwitchContainer(
                    title1: t.trackers.kg.title,
                    title2: t.trackers.g.title,
                  ),
                ],
              ),
            ),

            /// Grafic
            Padding(
              padding: const EdgeInsets.only(bottom: 16, top: 0),
              child: SizedBox(
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
                    title: t.trackers.weight.add,
                    onTap: () {
                      context.pushNamed(AppViews.addWeightView);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// Stories
            Center(
              child: Text(
                t.trackers.stories.title,
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
                    title1: t.trackers.news.title,
                    title2: t.trackers.old.title,
                    // isTrue: false,
                  ),
                  SwitchContainer(
                    title1: t.trackers.kg.title,
                    title2: t.trackers.g.title,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RowStroriesData(
                data: t.trackers.date.title,
                week: t.trackers.weeks.title,
                weight: t.trackers.weight.title,
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
