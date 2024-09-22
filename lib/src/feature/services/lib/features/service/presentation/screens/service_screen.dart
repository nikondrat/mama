import 'package:flutter/material.dart';
import 'package:mama_and_co/features/ages/presentation/screens/ages_screen.dart';
import 'package:mama_and_co/features/authors/presentation/screens/authors_screens.dart';
import 'package:mama_and_co/features/categories/presentation/screens/category_screen.dart';
import 'package:mama_and_co/features/saved_files/presentation/screens/saved_files_screen.dart';
import 'package:mama_and_co/features/service/presentation/widgets/common_article_card.dart';

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
            color: Color(0xff4D4DE8),
          ),
        ),
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BackButton(
              onPressed: () {},
            ),
            Text('Назад'),
          ],
        ),
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
            icon: Image.asset('assets/images/save.png'),
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
