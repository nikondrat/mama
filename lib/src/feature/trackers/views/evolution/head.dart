import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';

class Head extends StatelessWidget {
  const Head({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// To Know More Contaner
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: ToKnowMoreContainer(),
            ),

            /// Current and Dynamic Container
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CurrentAndDymanicContainer(),
            ),

            /// Grafic
            const Padding(
              padding: EdgeInsets.only(bottom: 16, top: 0),
              child: SizedBox(
                height: 278,
                child: FlProgressChart(),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  KnowMoreButton(
                    onTap: () {},
                  ),
                  const SizedBox(width: 8),
                  AddButton(
                    title: t.trackers.head.add,
                    onTap: () {
                      context.pushNamed(AppViews.addHeadView);
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            /// Stories
            Center(
              child: Text(
                t.trackers.stories.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),

            const SizedBox(height: 8),

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
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RowStroriesData(
                data: t.trackers.date.title,
                week: t.trackers.weeks.title,
                weight: t.trackers.head.title,
                style: AppTextStyles.f10w700.copyWith(
                  color: AppColors.greyBrighterColor,
                ),
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: RowStroriesData(
                      data: '25 октября',
                      week: '17',
                      weight: '42.2',
                      style: AppTextStyles.f17w400,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
