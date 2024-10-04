import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
