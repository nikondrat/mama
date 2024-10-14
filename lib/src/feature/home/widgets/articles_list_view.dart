import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mama/src/data.dart';
import 'package:provider/provider.dart';

class ArticlesListView extends StatelessWidget {
  const ArticlesListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ArticleStore articleStore = context.watch<ArticleStore>();

    return Observer(builder: (context) {
      return SizedBox(
        height: 220,
        child: ListView.separated(
          itemCount: articleStore.articles.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemBuilder: (context, index) {
            final article = articleStore.articles[index];

            return ArticleBox(
              model: article,
            );
          },
          separatorBuilder: (context, index) => const SizedBox(width: 8),
        ),
      );
    });
  }
}
