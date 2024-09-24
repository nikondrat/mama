import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            /// #good afternoon title
            Text(
              t.home.goodAfternoon.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            /// #today's date subtitle
            Text(
              t.home.todayIsFridaySeptemberTwentySecond.title,
              style: TextStyle(fontSize: 17),
            ),
            SizedBox(height: 24),

            /// #baby image
            CustomBackground(
              height: 220,
              padding: 16,
              child: Row(
                children: [
                  /// #left side
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// #counter
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                color:
                                    AppColors.yellowChildStatusBackgroundColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.whiteColor.withOpacity(0.5),
                                    AppColors.blackColor.withOpacity(0.5),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0).copyWith(top: 24),
                                child: Text(
                                  t.home.soonSixMonths.title,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),

                            /// #icon
                            Positioned(
                              top: -40,
                              child: Text(
                                '🥳',
                                style: TextStyle(fontSize: 50),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),

                        /// #birth date
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// #first type
                            Text(
                              t.home.FiveMonthsEighteenDays.title,
                              style: TextStyle(fontSize: 17),
                            ),

                            /// #second type
                            Text(
                              t.home.orTwentyFourWeeks.title,
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),

                  /// #baby image, edit button
                  Stack(
                    children: [
                      /// #
                      Expanded(
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(Assets.images.imgKid.path),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),

            /// #
            CustomBackground(
              height: 515,
              padding: 16,
              child: Column(
                children: [
                  /// #custom service box
                  Row(
                    children: [
                      /// #
                      CustomServiceBox(
                        imagePath: Assets.images.imgChat4x.path,
                        text: t.home.supportChats.title,
                      ),
                      SizedBox(width: 8),

                      /// #
                      CustomServiceBox(
                        imagePath: Assets.images.imgChatVideo4x.path,
                        text: t.home.supportChats.title,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  /// #custom service box
                  Row(
                    children: [
                      /// #
                      CustomServiceBox(
                        imagePath: Assets.images.imgProgress4x.path,
                        text: t.home.progressDiary.title,
                      ),
                      SizedBox(width: 8),

                      /// #
                      CustomServiceBox(
                        imagePath: Assets.images.imgMoonMusic4x.path,
                        text: t.home.musicForSleep.title,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),

                  /// #long box
                  CustomServiceBoxTwo(
                    imagePath: Assets.images.imgHat4x.path,
                    text: t.home.knowledgeCenter.title,
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),

            /// #
            CustomBackground(
              height: null,
              padding: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// #
                  Text(
                    t.home.current.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  /// #
                  SizedBox(height: 16),

                  /// #
                  SizedBox(
                    height: 220,
                    child: ListView.separated(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// #
                            Image(
                              width: 165,
                              height: 165,
                              image: AssetImage(Assets.images.imgMomOne4x.path),
                            ),

                            /// #
                            SizedBox(
                              width: 165,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: AppColors.blackColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(16),
                                    bottomRight: Radius.circular(16),
                                  ),
                                ),
                                child: Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8)
                                        .copyWith(top: 4),
                                    child: Text(
                                      'Развитие ребенка в 6 месяцев',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
