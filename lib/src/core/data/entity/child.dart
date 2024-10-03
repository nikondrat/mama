import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'child.g.dart';

enum Gender {
  @JsonValue('FEMALE')
  female,
  @JsonValue('MALE')
  male,
}

enum Childbirth {
  @JsonValue('NATURAL')
  natural,
  @JsonValue('CESARIAN')
  cesarian,
}

@JsonSerializable()
class ChildModel extends _ChildModel with _$ChildModel {
  @JsonKey(name: 'id', includeIfNull: false)
  final String? id;

  @JsonKey(
    name: 'updated_at',
    includeToJson: false,
  )
  final DateTime? updatedAt;

  @JsonKey(
    name: 'created_at',
    includeToJson: false,
  )
  final DateTime? createdAt;

  ChildModel({
    this.id,
    required super.firstName,
    super.secondName,
    this.updatedAt,
    this.createdAt,
    super.avatarUrl,
    super.gender,
    super.isTwins,
    super.childbirth,
    super.childBirthWithComplications,
    super.birthDate,
    super.height,
    super.weight,
    super.headCircumference,
    super.about,
  });

  factory ChildModel.fromJson(Map<String, dynamic> json) =>
      _$ChildModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChildModelToJson(this);
}

abstract class _ChildModel with Store {
  _ChildModel({
    this.avatarUrl,
    this.gender = Gender.male,
    this.isTwins = false,
    this.childbirth,
    this.birthDate,
    this.height,
    this.weight,
    this.headCircumference,
    this.about,
    required this.firstName,
    required this.secondName,
    this.childBirthWithComplications = false,
  });

  @observable
  @JsonKey(name: 'first_name')
  String firstName;

  @action
  setFirstName(String value) => firstName = value;

  @observable
  @JsonKey(
    name: 'second_name',
    includeIfNull: false,
  )
  String? secondName;

  @action
  setSecondName(String? value) => secondName = value;

  @observable
  @JsonKey(
    name: 'avatar',
    includeToJson: false,
  )
  String? avatarUrl;

  @action
  setAvatar(String value) => avatarUrl = value;

  @observable
  Gender gender = Gender.male;

  @action
  setGender(Gender value) {
    gender = value;
  }

  @observable
  @JsonKey(name: 'is_twins')
  bool isTwins = false;

  @action
  setIsTwins(bool value) => isTwins = value;

  @observable
  @JsonKey(
    name: 'childbirth',
    includeIfNull: false,
  )
  Childbirth? childbirth;

  @action
  setChildbirth(Childbirth value) => childbirth = value;

  @observable
  @JsonKey(name: 'childbirth_with_complications')
  bool childBirthWithComplications = false;

  @action
  setChildbirthWithComplications(bool value) =>
      childBirthWithComplications = value;

  @observable
  @JsonKey(
    name: 'birth_date',
    includeIfNull: false,
  )
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

  @observable
  @JsonKey(
    name: 'about',
    includeIfNull: false,
  )
  String? about;

  @action
  setAbout(String? value) => about = value;
}
