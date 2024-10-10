import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'user_data.g.dart';

@JsonSerializable()
class UserData {
  final AccountModel account;

  final List<ChildModel> childs;

  @JsonKey(name: 'user')
  final UserModel user;

  UserData({
    required this.account,
    required this.childs,
    required this.user,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
