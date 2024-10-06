import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/feature/profile/model/profile/model.dart';

part 'profile_model.g.dart';

@JsonSerializable()
class ProfileModel {
  @JsonKey()
  final AccountModel account;

  @JsonKey()
  final List<ChildsModel> childs;

  @JsonKey(name: 'user')
  final UserModel user;

  ProfileModel(
      {required this.account, required this.user, required this.childs});

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  /// Connect the generated [_$ProfileModelFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProfileModelToJson(this);

  @override
  String toString() {
    return 'ProfileModel{account: $account, user: $user, childs: $childs}';
  }
}
