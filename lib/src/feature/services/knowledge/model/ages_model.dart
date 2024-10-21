class AgesModel {
  final String tittle;
  final int count;

  AgesModel({
    required this.tittle,
    required this.count,
  });
}

List<AgesModel> agesList = [
  AgesModel(
    tittle: 'Первый месяц',
    count: 3,
  ),
  AgesModel(
    tittle: '2 месяца',
    count: 2,
  ),
  AgesModel(
    tittle: '3 месяца',
    count: 5,
  ),
  AgesModel(
    tittle: '4 месяца',
    count: 2,
  ),
  AgesModel(
    tittle: '5 месяцев',
    count: 4,
  ),
  AgesModel(
    tittle: '5 месяцев',
    count: 3,
  ),
  AgesModel(
    tittle: '12 месяцев',
    count: 2,
  ),
  AgesModel(
    tittle: 'После года',
    count: 5,
  ),
];
