import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'child.g.dart';

enum ChildGender {
  @JsonValue('female')
  female,
  @JsonValue('male')
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
  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @JsonKey(name: 'created_at')
  final DateTime? createdAt;

  ChildModel({
    required this.id,
    required super.firstName,
    required super.secondName,
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
    this.gender = ChildGender.male,
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
  @JsonKey(name: 'second_name')
  String secondName;

  @action
  setSecondName(String value) => secondName = value;

  @observable
  @JsonKey(name: 'avatar')
  String? avatarUrl;

  @action
  setAvatar(String value) => avatarUrl = value;

  @observable
  ChildGender gender = ChildGender.male;

  @action
  setGender(ChildGender value) {
    gender = value;
  }

  @observable
  @JsonKey(name: 'is_twins')
  bool isTwins = false;

  @action
  setIsTwins(bool value) => isTwins = value;

  @observable
  @JsonKey(name: 'childbirth')
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

  @observable
  @JsonKey(name: 'about')
  String? about;

  @action
  setAbout(String? value) => about = value;
}
