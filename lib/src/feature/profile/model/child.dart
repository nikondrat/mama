import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'child.g.dart';

enum ChildGender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
}

enum Childbirth {
  @JsonValue('NATURAL')
  natural,
  @JsonValue('CESARIAN')
  cesarian,
}

@JsonSerializable()
class ChildModel extends _ChildModel with _$ChildModel {
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'second_name')
  final String secondName;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  ChildModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    this.updatedAt,
    this.createdAt,
    super.avatarUrl,
    super.gender,
    super.isTwins,
    super.childbirth,
    super.childbirthWithComplications,
    super.birthDate,
    super.height,
    super.weight,
    super.headCircumference,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
}

abstract class _ChildModel with Store {
  _ChildModel({
    this.avatarUrl,
    this.gender = ChildGender.male,
    this.isTwins = false,
    this.childbirth = Childbirth.natural,
    this.childbirthWithComplications = false,
    this.birthDate,
    this.height,
    this.weight,
    this.headCircumference,
  });

  @observable
  @JsonKey(name: 'avatar')
  String? avatarUrl;

  @action
  setAvatar(String value) => avatarUrl = value;

  @observable
  ChildGender gender = ChildGender.male;

  @action
  setGender(ChildGender value) => gender = value;

  @observable
  @JsonKey(name: 'is_twins')
  bool isTwins = false;

  @action
  setIsTwins(bool value) => isTwins = value;

  @observable
  @JsonKey(name: 'childbirth')
  Childbirth childbirth = Childbirth.natural;

  @action
  setChildbirth(Childbirth value) => childbirth = value;

  @observable
  @JsonKey(name: 'childbirth_with_complications')
  bool childbirthWithComplications = false;

  @action
  setChildbirthWithComplications(bool value) =>
      childbirthWithComplications = value;

  @observable
  @JsonKey(name: 'birth_date')
  DateTime? birthDate;

  @action
  setBirthDate(DateTime? value) => birthDate = value;

  @observable
  @JsonKey(name: 'weight')
  double? weight;

  @action
  setWeight(double? value) => weight = value;

  @observable
  @JsonKey(name: 'height')
  double? height;

  @action
  setHeight(double? value) => height = value;

  @observable
  @JsonKey(name: 'head_circ')
  double? headCircumference;

  @action
  setHeadCircumference(double? value) => headCircumference = value;
}

//       "info": "string",
//       "status": {
//         "body": "string",
//         "description": "string",
//         "title": "string"
//       },