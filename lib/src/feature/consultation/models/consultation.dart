import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'consultation.g.dart';

enum ConsultationType {
  @JsonValue('CHAT')
  chat,
  @JsonValue('VIDEO')
  video,
  @JsonValue('EXPRESS')
  express,
}

enum ConsultationStatus {
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('PENDING')
  pending,
}

@JsonSerializable()
class Consultation extends BaseModel {
  final String? id;

  final DoctorModel? doctor;

  final ConsultationType type;

  final ConsultationStatus status;

  @JsonKey(name: 'time_begin')
  final DateTime? startedAt;

  @JsonKey(name: 'time_end')
  final DateTime? endedAt;

  Consultation({
    this.id,
    this.doctor,
    this.type = ConsultationType.chat,
    this.status = ConsultationStatus.pending,
    this.startedAt,
    super.updatedAt,
    super.createdAt,
    this.endedAt,
  });

  factory Consultation.fromJson(Map<String, dynamic> json) =>
      _$ConsultationFromJson(json);

  Map<String, dynamic> toJson() => _$ConsultationToJson(this);
}
