import 'package:flutter/material.dart';
import 'package:mama_and_co/features/service/presentation/widgets/categories_widget/categories_widgets.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Категории',
          style: TextStyle(
            color: Color(0xff4D4DE8),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  BuildCategory(
                    title: 'Здоровье ребенка',
                    count: 30,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Стул',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'ОРВИ',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Прогулка с малышом',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Витамины',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Зубы',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Массаж',
                        count: 2,
                      ),
                      BuildSubCategory(
                        title: 'Остеопатия',
                        count: 2,
                      ),
                    ],
                  ),
                  BuildCategory(
                    title: 'Первая помощь',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      )
                    ],
                  ),
                  BuildCategory(
                    title: 'Грудное и искусственное вскармливание',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      ),
                    ],
                  ),
                  BuildCategory(
                    title: 'Сон',
                    count: 19,
                    subCategories: [
                      BuildSubCategory(
                        title: 'Чек-листы по здоровью',
                        count: 2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: CommonRowElevBtn(),
            ),
          ],
        ),
      ),
    );
  }
}
