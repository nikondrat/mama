import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:mama/src/data.dart';

class HomeUserBody extends StatelessWidget {
  const HomeUserBody({super.key});

  @override
  Widget build(BuildContext context) {
    final String locale =
        TranslationProvider.of(context).flutterLocale.languageCode;

    final DateTime today = DateTime.now();

    String dayOfWeek = DateFormat.EEEE(locale).format(today);
    String day = DateFormat.d(locale).format(today);
    String month = DateFormat.MMMM(locale).format(today);

    return ListView(
      children: [
        /// #good afternoon title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GreetingTitle(title: t.home.goodAfternoon.title),
        ),

        /// #today's date subtitle
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DateSubtitle(
              subtitle: 'Сегодня $dayOfWeek $day $month',

              // t.home.todayIsFridaySeptemberTwentySecond.title,
            )),
        24.h,

        /// #baby image
        const ChildInfo(),
        26.h,

        /// #services
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
                  8.w,

                  /// #
                  CustomServiceBox(
                    imagePath: Assets.images.imgChatVideo4x.path,
                    text: t.home.supportChats.title,
                  ),
                ],
              ),
              8.h,

              /// #custom service box
              Row(
                children: [
                  /// #
                  CustomServiceBox(
                    imagePath: Assets.images.imgProgress4x.path,
                    text: t.home.progressDiary.title,
                  ),
                  const SizedBox(width: 8),

                  /// #
                  CustomServiceBox(
                    imagePath: Assets.images.imgMoonMusic4x.path,
                    text: t.home.musicForSleep.title,
                    onTap: () {
                      context.pushNamed(AppViews.servicesSleepMusicView);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8),

              /// #long box
              CustomServiceBoxTwo(
                imagePath: Assets.images.imgHat4x.path,
                text: t.home.knowledgeCenter.title,
                onTap: () {},
              ),
            ],
          ),
        ),
        16.h,

        /// #current
        CustomBackground(
          height: null,
          padding: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              /// #article category text
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  t.home.current.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              /// #articles
              SizedBox(
                height: 220,
                child: ListView.separated(
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return ArticleBox(
                      imagePath: Assets.images.imgMomOne4x.path,
                      articleCategory: t.home.sixMonths.title,
                      articleTitle: t.home.articleTitleOne.title,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
        16.h,

        // /// #for you
        // CustomBackground(
        //     height: null,
        //     padding: 0,
        //     child: Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           SizedBox(height: 16),

        //           /// #article category text
        //           Padding(
        //             padding: const EdgeInsets.symmetric(horizontal: 16),
        //             child: Text(
        //               t.home.forYou.title,
        //               style: TextStyle(
        //                 fontSize: 24,
        //                 fontWeight: FontWeight.w700,
        //               ),
        //             ),
        //           ),
        //           SizedBox(height: 16),

        //           /// #articles
        //           SizedBox(
        //             height: 220,
        //             child: ListView.separated(
        //               itemCount: 10,
        //               scrollDirection: Axis.horizontal,
        //               padding: EdgeInsets.symmetric(horizontal: 16),
        //               itemBuilder: (context, index) {
        //                 return ArticleBox(
        //                   imagePath: Assets.images.imgKidOne4x.path,
        //                   articleCategory: t.home.cesarean.title,
        //                   articleTitle: t.home.articleTitleTwo.title,
        //                 );
        //               },
        //               separatorBuilder: (context, index) =>
        //                   SizedBox(width: 8),
        //             ),
        //           ),
        //         ])),
        16.h
        //       SizedBox(height: 24),
      ],
    );
  }
}
