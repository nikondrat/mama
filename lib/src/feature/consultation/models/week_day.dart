import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'week_day.g.dart';

@JsonSerializable()
class WeekDay {
  @JsonKey(name: 'is_work')
  final bool isWork;

  @JsonKey(name: 'work_slots')
  final List<WorkSlot> workSlots;

  WeekDay({
    required this.isWork,
    required this.workSlots,
  });

  factory WeekDay.fromJson(Map<String, dynamic> json) =>
      _$WeekDayFromJson(json);

  Map<String, dynamic> toJson() => _$WeekDayToJson(this);
}
