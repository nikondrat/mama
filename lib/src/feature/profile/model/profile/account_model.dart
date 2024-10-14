import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable()
class AccountModel {
  @JsonKey()
  final String? avatar;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey()
  final String email;

  @JsonKey(name: 'favorite_article')
  final String favoriteArticle;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey()
  final Gender gender;

  @JsonKey()
  final String id;

  @JsonKey()
  final String info;

  @JsonKey(name: 'is_deleted')
  final bool isDeleted;

  @JsonKey(name: 'last_active_at')
  final String lastActiveAt;

  @JsonKey(name: 'last_name')
  final String lastName;

  @JsonKey()
  final String phone;

  @JsonKey()
  final String profession;

  @JsonKey()
  final Role role;

  @JsonKey(name: 'second_name')
  final String secondName;

  @JsonKey()
  final State state;

  @JsonKey()
  final Status status;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  AccountModel(
      {required this.avatar,
      required this.createdAt,
      required this.email,
      required this.favoriteArticle,
      required this.firstName,
      required this.gender,
      required this.id,
      required this.info,
      required this.isDeleted,
      required this.lastActiveAt,
      required this.lastName,
      required this.phone,
      required this.profession,
      required this.role,
      required this.secondName,
      required this.state,
      required this.status,
      required this.updatedAt});

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  /// Connect the generated [_$AccountModelFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  @override
  String toString() {
    return 'AccountModel{avatar: $avatar, createdAt: $createdAt, email: $email, favoriteArticle: $favoriteArticle, firstName: $firstName, gender: $gender, id: $id, info: $info, isDeleted: $isDeleted, lastActiveAt: $lastActiveAt, lastName: $lastName, phone: $phone, profession: $profession, role: $role, secondName: $secondName, state: $state, status: $status, updatedAt: $updatedAt}';
  }
}

enum Gender {
  @JsonValue('MALE')
  male,

  @JsonValue('FEMALE')
  female,
}

enum Role {
  @JsonValue('ADMIN')
  admin,

  @JsonValue('USER')
  user
}

enum State {
  @JsonValue('ACTIVE')
  active
}

enum Status {
  @JsonValue('SUBSCRIBED')
  subscribed,

  @JsonValue('NO_SUBSCRIBED')
  noSubscribe,

  @JsonValue('TRIAL')
  trial
}
