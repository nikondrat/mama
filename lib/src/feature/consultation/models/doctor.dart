import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'doctor.g.dart';

@JsonSerializable()
class DoctorModel extends BaseModel {
  final String? id;

  @JsonKey(name: 'account_id')
  final String? accountId;

  final AccountModel? account;

  @JsonKey(name: 'is_consultation')
  final bool isConsultation;

  @JsonKey(name: 'profession')
  final String? profession;

  DoctorModel({
    this.id,
    this.account,
    this.accountId,
    this.isConsultation = false,
    this.profession,
    super.updatedAt,
    super.createdAt,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
}
