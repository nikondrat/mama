class CategoryModel {
  final String tittle;
  final int count;

  CategoryModel({required this.tittle, required this.count});
}

List<CategoryModel> categoriesList = [
  CategoryModel(tittle: 'Здоровье ребенка', count: 2),
  CategoryModel(tittle: 'tittle', count: 5),
  CategoryModel(tittle: 'Здоровье ребенка', count: 2),
  CategoryModel(tittle: 'tittle', count: 5),
  CategoryModel(tittle: 'Здоровье ребенка', count: 2),
  CategoryModel(tittle: 'tittle', count: 5),
];
