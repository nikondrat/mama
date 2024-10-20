import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'consultations.g.dart';

@JsonSerializable()
class Consultations {
  @JsonKey(name: 'consultations')
  final List<Consultation>? data;

  Consultations({this.data});

  factory Consultations.fromJson(Map<String, dynamic> json) =>
      _$ConsultationsFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationsToJson(this);
}
