import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel extends _AccountModel with _$AccountModel {
  @JsonKey(name: 'id', includeIfNull: false)
  String? id;

  @JsonKey(name: 'fcm_token')
  String fcmToken;

  @JsonKey(includeToJson: false)
  final String? profession;

  Gender gender;

  @JsonKey(includeToJson: false)
  final Role? role;

  @JsonKey(includeToJson: false)
  final Status? status;

  AccountModel({
    this.fcmToken = '',
    required this.gender,
    required super.firstName,
    required super.secondName,
    required super.phone,
    super.avatarUrl,
    super.email,
    super.info,
    this.id,
    this.profession,
    this.role,
    this.status,
  });

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  Map<String, dynamic> toJson() => _$AccountModelToJson(this);
}

abstract class _AccountModel with Store {
  _AccountModel({
    required this.firstName,
    required this.secondName,
    required this.phone,
    this.avatarUrl,
    this.email,
    this.info,
  });

  @observable
  @JsonKey(name: 'first_name')
  String firstName = '';

  @observable
  @JsonKey(name: 'second_name')
  String secondName = '';

  @observable
  @JsonKey(name: 'phone')
  String phone = '';

  @observable
  @JsonKey(name: 'avatar', includeIfNull: false)
  String? avatarUrl;

  @observable
  @JsonKey(name: 'email', includeIfNull: false)
  String? email;

  @observable
  @JsonKey(name: 'info')
  String? info;
}

enum Role {
  @JsonValue('ADMIN')
  admin,

  @JsonValue('USER')
  user
}

enum Status {
  @JsonValue('SUBSCRIBED')
  subscribed,

  @JsonValue('NO_SUBSCRIBED')
  noSubscribe
}
