import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            /// #
            Text(
              t.home.goodAfternoon.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            /// #
            Text(
              t.home.todayIsFridaySeptemberTwentySecond.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),

            /// #
            DecoratedBox(
              decoration: BoxDecoration(),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  children: [
                    /// #
                    Column(
                      children: [
                        /// #
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: AppColors.yellowChildStatusBackgroundColor,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.blackColor.withOpacity(0.5),
                                AppColors.whiteColor.withOpacity(0.5),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.0).copyWith(top: 24),
                            child: SizedBox(
                              child: Text(
                                t.home.soonSixMonths.title,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),

                        /// #
                        Text(
                          t.home.FiveMonthsEighteenDays.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          t.home.orTwentyFourWeeks.title,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 8),

                    /// #
                    Stack(
                      children: [],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
