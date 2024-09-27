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
          'Центр знаний',
          style: TextStyle(
            color: AppColors.blue,
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
            icon: Image.asset(Assets.icons.icPhotoAdd.path),
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
                    name: 'Категории',
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
                    name: 'Возраст',
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
                      name: 'Автор',
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
                      role: 'Акушер',
                      title: 'Развитие ребенка в 6 месяцев',
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const Column(
                  children: [
                    SizedBox(height: 15),
                    Divider(),
                    SizedBox(height: 15),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CommonElevatedButton extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;

  const CommonElevatedButton(
      {super.key, required this.name, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(name));
  }
}
