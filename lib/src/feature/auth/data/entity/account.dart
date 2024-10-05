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

  Gender gender;

  AccountModel({
    this.fcmToken = '',
    required this.gender,
    required super.firstName,
    required super.secondName,
    required super.phone,
    super.avatarUrl,
    super.email,
    super.info,
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
