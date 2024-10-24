import 'package:mama/src/feature/feeding/data/entity/pumping_data.dart';

List<GraphicData> getPumpingData() {
  return [
    GraphicData(weekDay: 'Пн 11', general: 98, top: 48, bottom: 50),
    GraphicData(weekDay: 'Вт 12', general: 117, top: 55, bottom: 62,),
    GraphicData(weekDay: 'Ср 13', general: 108, top: 52, bottom: 56),
    GraphicData(weekDay: 'Чт 14', general: 112, top: 47, bottom: 65),
    GraphicData(weekDay: 'Пт 15', general: 97, top: 47, bottom: 65),
    GraphicData(weekDay: 'Сб 16', general: 0, top: 0, bottom: 0),
    GraphicData(weekDay: 'Вс 17', general: 0, top: 0, bottom: 0),
  ];
}

List<GraphicData> getBottleData() {
  return [
    GraphicData(weekDay: 'Пн 11', general: 400, top: 250, bottom: 150),
    GraphicData(weekDay: 'Вт 12', general: 420, top: 300, bottom: 120,),
    GraphicData(weekDay: 'Ср 13', general: 410, top: 300, bottom: 110),
    GraphicData(weekDay: 'Чт 14', general: 450, top: 250, bottom: 200),
    GraphicData(weekDay: 'Пт 15', general: 400, top: 250, bottom: 150),
    GraphicData(weekDay: 'Сб 16', general: 0, top: 0, bottom: 0),
    GraphicData(weekDay: 'Вс 17', general: 0, top: 0, bottom: 0),
  ];
}
