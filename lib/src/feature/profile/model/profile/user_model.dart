import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey()
  final String id;

  @JsonKey(name: 'account_id')
  final String accountId;

  @JsonKey()
  final String city;

  @JsonKey(name: 'created_id')
  final String createdId;

  @JsonKey(name: 'end_prime')
  final String endPrime;

  @JsonKey()
  final List<String> roles;

  @JsonKey(name: 'start_prime')
  final String startPrime;

  @JsonKey(name: 'type_prime')
  final String typePrime;

  @JsonKey(name: 'updated_id')
  final String updatedId;

  UserModel(
      {required this.accountId,
      required this.city,
      required this.createdId,
      required this.endPrime,
      required this.id,
      required this.roles,
      required this.startPrime,
      required this.typePrime,
      required this.updatedId});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Connect the generated [_$UserModelFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  String toString() {
    return 'UserModel{accountId: $accountId, city: $city, createdAt: $createdId, endPrime: $endPrime, id: $id, roles: $roles, startPrime: $startPrime, typePrime: $typePrime, updatedId: $updatedId}';
  }

}
