import 'package:flutter/material.dart';
import 'package:mama/src/data.dart';

class ArticlesListView extends StatelessWidget {
  final List listData;
  const ArticlesListView({
    super.key,
    required this.listData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.separated(
        itemCount: listData.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final article = listData[index];

          return ArticleBox(
            model: article,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
      ),
    );
  }
}
