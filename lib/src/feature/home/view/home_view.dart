import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final ColorScheme colorScheme = themeData.colorScheme;

    return Scaffold(
      appBar: CustomAppBar(
        leading: ProfileWidget(
          onTap: () {
            context.pushNamed(AppViews.profile);
          },
          alignment: Alignment.centerLeft,
          avatarUrl:
              'https://i.pinimg.com/564x/49/3c/e7/493ce760bc067f2530d73365ace0d66c.jpg',
        ),
        action: ProfileWidget(
          isShowText: true,
          childrenAvatars: [
            'https://i.pinimg.com/564x/63/c3/99/63c399373f8afa96dfb36eb6a1874a2c.jpg',
            'https://i.pinimg.com/564x/33/08/35/33083558f59dadc6ab278d974703ad87.jpg'
          ],
        ),
      ),
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
                            ShaderMask(
                                shaderCallback: (bounds) {
                                  return LinearGradient(
                                    begin: Alignment.center,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      AppColors.whiteColor,
                                      AppColors.yellowColor,
                                    ],
                                  ).createShader(bounds);
                                },
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: AppColors.yellowColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.all(8.0).copyWith(top: 24),
                                    child: Text(
                                      t.home.soonSixMonths.title,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                )),

                            //                 /// #icon
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
                  8.w,

                  //       /// #baby image, edit button
                  Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      /// #
                      Expanded(
                        child: Image(
                          fit: BoxFit.contain,
                          image: AssetImage(Assets.images.imgKid.path),
                        ),
                      ),
                      Positioned(
                          bottom: -30,
                          child: FloatingActionButton(
                            onPressed: () {},
                            backgroundColor: colorScheme.primary,
                            shape: CircleBorder(),
                            child: IconWidget(
                                model: IconModel(
                              icon: Icons.edit,
                              color: colorScheme.onPrimary,
                            )),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(height: 26),
            26.h,

            // /// #services
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
                      SizedBox(width: 8),

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
                  SizedBox(height: 8),

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
            // SizedBox(height: 16),

            // /// #current
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
                          articleTitle: t.home.articleTitleOne.title,
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(width: 8),
                    ),
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),
            // SizedBox(height: 16),
            16.h,

            // /// #for you
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
                          t.home.forYou.title,
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
                              imagePath: Assets.images.imgKidOne4x.path,
                              articleCategory: t.home.cesarean.title,
                              articleTitle: t.home.articleTitleTwo.title,
                            );
                          },
                          separatorBuilder: (context, index) =>
                              SizedBox(width: 8),
                        ),
                      ),
                    ])),
            16.h
            //       SizedBox(height: 24),
          ],
        ),
      ),
      // SizedBox(height: 16),
    );
  }
}
