import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeSpecialistBody extends StatelessWidget {
  const HomeSpecialistBody({super.key});

  @override
  Widget build(BuildContext context) {
    final phonePadding = MediaQuery.of(context).padding;

    final meetingsListOne = [
      for (int i = 0; i < 5; i++)
        MeetingBox(
          scheduledTime: t.home.timeScheduleOne.title,
          meetingType: t.home.chat.title,
          isCancelled: i == 2 ? true : false,
          tutorFullName: t.home.tutorFullNameOne.title,
          whichSection: 1,
        ),
    ];

    final meetingsListTwo = [
      for (int i = 0; i < 7; i++)
        MeetingBox(
          scheduledTime: t.home.timeScheduleOne.title,
          meetingType: t.home.chat.title,
          isCancelled: false,
          tutorFullName: t.home.tutorFullNameOne.title,
          whichSection: 2,
        ),
    ];

    return ListView(
      children: [
        /// #good afternoon title, today's date subtitleƒ
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// #good afternoon title
              GreetingTitle(title: t.home.goodAfternoon.title),

              /// #today's date subtitle
              DateSubtitle(
                subtitle: t.home.todayIsFridaySeptemberTwentySecond.title,
              ),
            ],
          ),
        ),
        16.h,

        /// #meetings
        CustomBackground(
          padding: 16,
          height: null,
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

              /// #meetings section one
              MeetingsSection(
                whichSection: 1,
                meetingsList: meetingsListOne,
              ),
              8.h,

              /// #meetings section two
              MeetingsSection(
                whichSection: 2,
                meetingsList: meetingsListTwo,
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
    );
  }
}
