import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/home/home.dart';

class HomeSchoolBody extends StatefulWidget {
  final UserStore userStore;
  final ArticleStore articleStore;
  const HomeSchoolBody(
      {super.key, required this.articleStore, required this.userStore});

  @override
  State<HomeSchoolBody> createState() => _HomeSchoolBodyState();
}

class _HomeSchoolBodyState extends State<HomeSchoolBody> {
  @override
  void initState() {
    widget.articleStore.fetchOwnList(widget.userStore.account.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          /// #good afternoon title
          GreetingTitle(title: t.home.goodAfternoon.title),

          /// #today's date subtitle
          DateSubtitle(),
          24.h,

          if (widget.articleStore.ownListData.isNotEmpty)

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
                      t.home.yourArticles,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  /// #articles
                  ArticlesListView(
                    listData: widget.articleStore.ownListData.toList(),
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
