import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel extends _AccountModel with _$AccountModel {
  @JsonKey(name: 'fcm_token')
  String fcmToken;

  Gender gender;

  AccountModel({
    this.fcmToken = '',
    required this.gender,
    required super.firstName,
    required super.secondName,
    required super.phone,
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
}
