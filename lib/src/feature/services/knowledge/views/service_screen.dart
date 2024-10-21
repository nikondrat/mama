import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/utils/router.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_article_card.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_chip_btn.dart';

class ServiceKnowledgeScreen extends StatelessWidget {
  const ServiceKnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: t.services.knowledgeCenter.title,
        action: IconButton(
          onPressed: () {
            context.pushNamed(AppViews.savedFiles);
          },
          icon: Image.asset(
            Assets.images.save.path,
            height: 28,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          Center(
            child: SizedBox(
              height: 40,
              width: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  CommonChipButton(
                    name: t.services.categoriesBtn.title,
                    onPressed: () {
                      context.pushNamed(AppViews.categories);
                    },
                  ),
                  const SizedBox(width: 20),
                  CommonChipButton(
                    name: t.services.ageBtn.title,
                    onPressed: () {
                      context.pushNamed(AppViews.ages);
                    },
                  ),
                  const SizedBox(width: 20),
                  CommonChipButton(
                    name: t.services.authorBtn.title,
                    onPressed: () {
                      context.pushNamed(AppViews.author);
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ArticleCard(
                    author: 'Жанна Коршунова',
                    role: t.services.obstetrician.title,
                    title: t.services.childDevelopment.title,
                  );
                },
                separatorBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      children: [
                        Divider(),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
