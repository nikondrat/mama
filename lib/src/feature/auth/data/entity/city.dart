import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;

  final String name;

  @JsonKey(name: 'country_id')
  final int country;

  City({
    required this.id,
    required this.name,
    required this.country,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
