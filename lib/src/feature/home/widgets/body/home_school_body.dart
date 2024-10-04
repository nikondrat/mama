import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeSchoolBody extends StatelessWidget {
  const HomeSchoolBody({super.key});

  @override
  Widget build(BuildContext context) {
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
            24.h,
      
            /// #my articles
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
                          articleTitle: '${t.home.articleTitleOne.title}aadfadsfadsfsdafasdfasdfas',
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                    ),
                  ),
      
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
