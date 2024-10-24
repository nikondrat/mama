import 'package:json_annotation/json_annotation.dart';

part 'work_slot.g.dart';

@JsonSerializable()
class WorkSlot {
  @JsonKey(name: 'is_busy')
  final bool isBusy;

  @JsonKey(name: 'work_slot')
  final String workSlot;

  WorkSlot({
    required this.isBusy,
    required this.workSlot,
  });

  factory WorkSlot.fromJson(Map<String, dynamic> json) =>
      _$WorkSlotFromJson(json);

  Map<String, dynamic> toJson() => _$WorkSlotToJson(this);
}
