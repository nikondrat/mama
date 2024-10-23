import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'doctors.g.dart';

@JsonSerializable()
class Doctors {
  @JsonKey(name: 'doctors')
  final List<DoctorModel>? data;

  Doctors({this.data});

  factory Doctors.fromJson(Map<String, dynamic> json) =>
      _$DoctorsFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorsToJson(this);
}
