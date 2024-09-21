class ChooseCategoryModel {
  final String? categoryName;
  final List<CategoryItem>? items;

  ChooseCategoryModel({
    this.categoryName,
    this.items,
  });
}

class CategoryItem {
  final String? name;
  final int? count;
  bool isChecked;

  CategoryItem({
    this.name,
    this.count,
    this.isChecked = false,
  });
}

// Example usage
List<ChooseCategoryModel> categories = [
  ChooseCategoryModel(
    categoryName: 'Здоровье ребенка',
    items: [
      CategoryItem(name: 'Чек-листы по здоровью', count: 2),
      CategoryItem(name: 'Сыпь: нормы и отклонения', count: 3),
      CategoryItem(name: 'Стул', count: 3),
      CategoryItem(name: 'ОРВИ', count: 4),
      CategoryItem(name: 'Прогулка с малышом', count: 2),
      CategoryItem(name: 'Витамины', count: 5),
      CategoryItem(name: 'Купание', count: 4),
      CategoryItem(name: 'Зубы', count: 3),
      CategoryItem(name: 'Массаж', count: 3),
      CategoryItem(name: 'Остеопатия', count: 5),
    ],
  ),
  ChooseCategoryModel(categoryName: 'Первая помощь'),
  ChooseCategoryModel(categoryName: 'Грудное и искусственное вскармливание'),
  ChooseCategoryModel(
    categoryName: 'Сон',
  ),
  ChooseCategoryModel(categoryName: 'Прикорм'),
  ChooseCategoryModel(categoryName: 'Развитие ребенка'),
  ChooseCategoryModel(categoryName: 'Мама после родов'),
  ChooseCategoryModel(categoryName: 'Путешествие с ребенком'),
  ChooseCategoryModel(categoryName: 'Полезные девайсы'),
];
