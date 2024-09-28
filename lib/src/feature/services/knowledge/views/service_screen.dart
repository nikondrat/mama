import 'package:flutter/material.dart';
import 'package:mama/src/core/core.dart';
import 'package:mama/src/feature/services/knowledge/views/ages_screen.dart';
import 'package:mama/src/feature/services/knowledge/views/authors_screens.dart';
import 'package:mama/src/feature/services/knowledge/views/category_screen.dart';
import 'package:mama/src/feature/services/knowledge/views/saved_files_screen.dart';
import 'package:mama/src/feature/services/knowledge/widgets/common_article_card.dart';

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SavedFilesScreen(),
                ),
              );
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
                  CommonElevatedButton(
                    name: t.services.categoriesBtn.title,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  CommonElevatedButton(
                    name: t.services.ageBtn.title,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgesScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 20),
                  CommonElevatedButton(
                      name: t.services.authorBtn.title,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AuthorsScreen(),
                          ),
                        );
                      })
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
                return Column(
                  children: [
                    ArticleCard(
                      author: 'Жанна Коршунова',
                      role: t.services.obstetrician.title,
                      title: t.services.childDevelopment.title,
                    ),
                  ],
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

