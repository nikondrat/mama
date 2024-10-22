import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'doctor_time.g.dart';

@JsonSerializable()
class DoctorWorkTime {
  final String? id;

  final WeekDay? monday;

  final WeekDay? tuesday;

  final WeekDay? wednesday;

  final WeekDay? thursday;

  final WeekDay? friday;

  final WeekDay? saturday;

  final WeekDay? sunday;

  const DoctorWorkTime({
    required this.id,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.sunday,
  });

  factory DoctorWorkTime.fromJson(Map<String, dynamic> json) =>
      _$DoctorWorkTimeFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorWorkTimeToJson(this);
}
