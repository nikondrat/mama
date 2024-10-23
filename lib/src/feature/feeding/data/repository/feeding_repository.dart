import 'package:mama/src/feature/feeding/data/entity/pumping_data.dart';

List<GraphicData> getPumpingData() {
  return [
    GraphicData(weekDay: 'Пн 11', general: 98, firstPart: 48, secondPart: 50),
    GraphicData(weekDay: 'Вт 12', general: 117, firstPart: 55, secondPart: 62,),
    GraphicData(weekDay: 'Ср 13', general: 108, firstPart: 52, secondPart: 56),
    GraphicData(weekDay: 'Чт 14', general: 112, firstPart: 47, secondPart: 65),
    GraphicData(weekDay: 'Пт 15', general: 97, firstPart: 47, secondPart: 65),
    GraphicData(weekDay: 'Сб 16', general: 0, firstPart: 0, secondPart: 0),
    GraphicData(weekDay: 'Вс 17', general: 0, firstPart: 0, secondPart: 0),
  ];
}

List<GraphicData> getBottleData() {
  return [
    GraphicData(weekDay: 'Пн 11', general: 400, firstPart: 250, secondPart: 150),
    GraphicData(weekDay: 'Вт 12', general: 420, firstPart: 300, secondPart: 120,),
    GraphicData(weekDay: 'Ср 13', general: 410, firstPart: 300, secondPart: 110),
    GraphicData(weekDay: 'Чт 14', general: 450, firstPart: 250, secondPart: 200),
    GraphicData(weekDay: 'Пт 15', general: 400, firstPart: 250, secondPart: 150),
    GraphicData(weekDay: 'Сб 16', general: 0, firstPart: 0, secondPart: 0),
    GraphicData(weekDay: 'Вс 17', general: 0, firstPart: 0, secondPart: 0),
  ];
}
