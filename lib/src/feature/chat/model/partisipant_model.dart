import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'partisipant_model.g.dart';

@JsonSerializable()
class PartisipantModel extends _PartisipantModel with _$PartisipantModel {
  PartisipantModel(
      {super.lastActiveAt,
      super.state,
      super.status,
      super.updatedAt,
      this.avatarUrl,
      this.email,
      required this.createdAt,
      this.favoriteArticle,
      required this.firstName,
      required this.gender,
      required this.id,
      this.info,
      this.isDeleted = false,
      this.lastName,
      required this.phone,
      this.profession,
      this.role,
      required this.secondName});

  @JsonKey(name: 'avatar')
  final String? avatarUrl;

  @JsonKey(name: 'email')
  final String? email;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  @JsonKey(name: 'favorite_article')
  final String? favoriteArticle;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'gender')
  final String gender;

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'info')
  final String? info;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'last_name')
  final String? lastName;

  @JsonKey(name: 'phone')
  final String phone;

  @JsonKey(name: 'profession')
  final String? profession;

  @JsonKey(name: 'role')
  final String? role;

  @JsonKey(name: 'second_name')
  final String? secondName;

  factory PartisipantModel.fromJson(Map<String, dynamic> json) =>
      _$PartisipantModelFromJson(json);

  Map<String, dynamic> toJson() => _$PartisipantModelToJson(this);
}

abstract class _PartisipantModel with Store {
  _PartisipantModel({
    this.lastActiveAt,
    this.state,
    this.status,
    this.updatedAt,
  });

  @observable
  @JsonKey(name: 'last_active_at')
  DateTime? lastActiveAt;

  @action
  setLastActiveAt(DateTime value) => lastActiveAt = value;

  @observable
  @JsonKey(name: 'state')
  String? state;

  @action
  setState(String value) => state = value;

  @observable
  @JsonKey(name: 'status')
  String? status;

  @action
  setStatus(String value) => status = value;

  @observable
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  @action
  setUpdatedAt(DateTime value) => updatedAt = value;
}
