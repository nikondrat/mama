import 'package:flutter/material.dart';
import 'package:mama_and_co/features/service/presentation/widgets/common_article_card.dart';

class SavedFilesScreen extends StatelessWidget {
  const SavedFilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          'Избранные статьи',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset('assets/images/save.png'),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
          shrinkWrap: true,
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
