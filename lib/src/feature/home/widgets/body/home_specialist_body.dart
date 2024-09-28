import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeSpecialistBody extends StatelessWidget {
  const HomeSpecialistBody({super.key});

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          /// #good afternoon title
          GreetingTitle(title: t.home.goodAfternoon.title),

          /// #today's date subtitle
          DateSubtitle(
            subtitle: t.home.todayIsFridaySeptemberTwentySecond.title,
          ),
          16.h,

          /// #meetings
          CustomBackground(
            padding: 16,
            height: 400,
            child: Column(
              children: [
                /// #switch section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// #switch
                    Row(
                      children: [
                        /// #left button
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.icons.icArrowLeftFilled,
                            color: AppColors.primaryColor,
                          ),
                        ),

                        /// #number date, word date
                        Column(
                          children: [
                            /// #number date
                            Text(
                              t.home.septemberTwentySecond.title,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),

                            /// #word date
                            Text(
                              t.home.today.title,
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: AppColors.greyBrighterColor,
                              ),
                            ),
                          ],
                        ),

                        /// #right button
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.icons.icArrowRightFilled,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),

                    /// #calendar button
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      color: AppColors.purpleLighterBackgroundColor,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                        child: SizedBox(
                          width: 48,
                          height: 48,
                          child: Padding(
                            padding: const EdgeInsets.all(14),
                            child: SvgPicture.asset(
                              Assets.icons.icCalendarBadgeClockFilled,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),

                /// #
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      border: Border.all(
                        color: AppColors.greenLighterBackgroundColor,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          MeetingBox(
                            scheduledTime: t.home.timeScheduleOne.title,
                            meetingType: t.home.chat.title,
                            isCancelled: true,
                            tutorFullName: t.home.tutorFullNameOne.title,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          16.h,

          /// #my articles
          CustomBackground(
            height: null,
            padding: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),

                /// #article category text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    t.home.current.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 16),

                /// #articles
                SizedBox(
                  height: 220,
                  child: ListView.separated(
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      return ArticleBox(
                        imagePath: Assets.images.imgMomOne4x.path,
                        articleCategory: t.home.sixMonths.title,
                        articleTitle:
                            '${t.home.articleTitleOne.title}aadfadsfadsfsdafasdfasdfas',
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                  ),
                ),

                SizedBox(height: 24),
              ],
            ),
          ),
          (phonePadding.bottom + 24).h,
        ],
      ),
    );
  }
}
