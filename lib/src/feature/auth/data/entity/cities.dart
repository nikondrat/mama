import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'cities.g.dart';

@JsonSerializable()
class CitiesData {
  @JsonKey(name: 'cities')
  final List<City> data;

  CitiesData(this.data);

  factory CitiesData.fromJson(Map<String, dynamic> json) =>
      _$CitiesDataFromJson(json);

  Map<String, dynamic> toJson() => _$CitiesDataToJson(this);
}
