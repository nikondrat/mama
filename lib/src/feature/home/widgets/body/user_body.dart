import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class HomeUserBody extends StatefulWidget {
  final ArticleStore articleStore;
  final UserStore userStore;
  const HomeUserBody({
    super.key,
    required this.userStore,
    required this.articleStore,
  });

  @override
  State<HomeUserBody> createState() => _HomeUserBodyState();
}

class _HomeUserBodyState extends State<HomeUserBody> {
  @override
  initState() {
    super.initState();
    widget.articleStore.fetchAll();
    widget.articleStore.fetchForMe(widget.userStore.account.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    final UserStore userStore = context.watch();
    final ArticleStore articleStore = context.watch<ArticleStore>();

    return Observer(builder: (context) {
      return ListView(
        children: [
          /// #good afternoon title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GreetingTitle(title: t.home.goodAfternoon.title),
          ),

          /// #today's date subtitle
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DateSubtitle()),

          if (userStore.children.isNotEmpty) ...[
            24.h,
            const ChildInfo(),
          ],
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
                      text: t.home.onlineConsultation.title,
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

          if (articleStore.hasResults)

            /// #current
            CustomBackground(
              height: null,
              padding: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.h,

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
                  16.h,

                  /// #articles

                  ArticlesListView(
                    listData: articleStore.listData.toList(),
                  ),

                  24.h,
                ],
              ),
            ),
          16.h,

          /// #for you
          if (articleStore.listForMe.isNotEmpty)
            CustomBackground(
                height: null,
                padding: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      16.h,

                      /// #article category text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          t.home.forYou.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      16.h,

                      /// #articles
                      ArticlesListView(
                        listData: articleStore.listForMe.toList(),
                      ),
                      24.h,
                    ])),

          16.h
          //       SizedBox(height: 24),
        ],
      );
    });
  }
}
