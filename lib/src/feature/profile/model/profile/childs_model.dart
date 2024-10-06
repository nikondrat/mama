import 'package:json_annotation/json_annotation.dart';

import 'model.dart';

part 'childs_model.g.dart';

@JsonSerializable()
class ChildsModel {
  @JsonKey()
  final String? avatar;

  @JsonKey(name: 'birth_date')
  final String? birthDate;

  @JsonKey(name: 'childbirth')
  final Childbirth childBirth;

  @JsonKey(name: 'childbirth_with_complications')
  final bool childbirthWithComplications;

  @JsonKey(name: 'created_at')
  final String? createdAt;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey()
  final Gender gender;

  @JsonKey(name: 'head_circ')
  final int? headCirc;

  @JsonKey()
  final int? height;

  @JsonKey()
  final String id;

  @JsonKey()
  final String? info;

  @JsonKey(name: 'is_twins')
  final bool isTwins;

  @JsonKey(name: 'second_name')
  final String? secondName;

  @JsonKey()
  final StatusModel status;

  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @JsonKey()
  final int weight;

  ChildsModel(
      {required this.avatar,
      required this.birthDate,
      required this.childBirth,
      required this.childbirthWithComplications,
      required this.createdAt,
      required this.firstName,
      required this.gender,
      required this.headCirc,
      required this.height,
      required this.id,
      required this.info,
      required this.isTwins,
      required this.secondName,
      required this.status,
      required this.updatedAt,
      required this.weight});

  factory ChildsModel.fromJson(Map<String, dynamic> json) =>
      _$ChildsModelFromJson(json);

  /// Connect the generated [_$ChildModelFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ChildsModelToJson(this);

  @override
  String toString() {
    return 'ChildsModel{avatar: $avatar, birthDate: $birthDate, childBirth: $childBirth, childbirthWithComplications: $childbirthWithComplications, createdAt: $createdAt, firstName: $firstName, gender: $gender, headCirc: $headCirc, height: $height, id: $id, info: $info, isTwins: $isTwins, secondName: $secondName, status: $status, updatedAt: $updatedAt, weight: $weight}';
  }
}

enum Childbirth {
  @JsonValue('NATURAL')
  natural,

  @JsonValue('CAESAREAN')
  caesarean
}
