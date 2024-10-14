import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';
import 'package:provider/provider.dart';

class HomeSchoolBody extends StatelessWidget {
  const HomeSchoolBody({super.key});

  @override
  Widget build(BuildContext context) {
    final ArticleStore articleStore = context.watch<ArticleStore>();

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

          if (articleStore.hasResults)

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
                  ArticlesListView(),

                  const SizedBox(height: 24),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
