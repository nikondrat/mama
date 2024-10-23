import 'package:json_annotation/json_annotation.dart';

part 'city.g.dart';

@JsonSerializable()
class City {
  final int id;

  final String name;

  @JsonKey(name: 'country_id')
  final int country;

  @JsonKey(name: 'country_name')
  final String countryName;

  City({
    required this.id,
    required this.name,
    required this.country,
    required this.countryName,
  });

  factory City.fromJson(Map<String, dynamic> json) => _$CityFromJson(json);

  Map<String, dynamic> toJson() => _$CityToJson(this);
}
