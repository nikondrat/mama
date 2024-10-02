import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'account.g.dart';

@JsonSerializable()
class AccountModel extends _AccountModel with _$AccountModel {
  Gender gender;

  AccountModel({
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
  String firstName = '';

  @observable
  String secondName = '';

  @observable
  String phone = '';
}
