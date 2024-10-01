import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/core/utils/router.dart';
import 'package:mama/src/feature/services/knowledge/views/saved_files_screen.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_article_card.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_elev_btn.dart';

class ServiceKnowledgeScreen extends StatelessWidget {
  const ServiceKnowledgeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.services.knowledgeCenter.title,
          style: TextStyle(
            color: AppColors.blueBrightTextColor,
            fontFamily: Assets.fonts.sFProTextMedium,
          ),
        ),
        leading: CustomBackButton(),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(AppViews.savedFiles);
            },
            icon: Image.asset(Assets.images.save.path),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 10),
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
                  SizedBox(width: 20),
                  CommonChipButton(
                    name: t.services.ageBtn.title,
                    onPressed: () {
                      context.pushNamed(AppViews.ages);
                    },
                  ),
                  SizedBox(width: 20),
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
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return ArticleCard(
                  author: 'Жанна Коршунова',
                  role: t.services.obstetrician.title,
                  title: t.services.childDevelopment.title,
                );
              },
              separatorBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: const Column(
                    children: [
                      Divider(),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
