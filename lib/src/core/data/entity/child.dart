import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';
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
  @JsonValue('CAESAREAN')
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
    required super.secondName,
    this.updatedAt,
    this.createdAt,
    super.avatarUrl,
    super.gender,
    super.isTwins,
    super.childbirth,
    super.childBirthWithComplications,
    required super.birthDate,
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
    this.childbirth = Childbirth.natural,
    required this.birthDate,
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
  setFirstName(String value) {
    firstName = value;

    isChanged = true;
  }

  @observable
  @JsonKey(
    name: 'second_name',
  )
  String? secondName;

  @action
  setSecondName(String value) {
    secondName = value;
    isChanged = true;
  }

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
    isChanged = true;
  }

  @observable
  @JsonKey(name: 'is_twins')
  bool isTwins = false;

  @action
  setIsTwins(bool value) {
    isTwins = value;

    isChanged = true;
  }

  @observable
  @JsonKey(
    name: 'childbirth',
    includeIfNull: false,
  )
  Childbirth childbirth;

  @action
  setChildbirth(Childbirth value) {
    childbirth = value;

    isChanged = true;
  }

  @observable
  @JsonKey(name: 'childbirth_with_complications')
  bool childBirthWithComplications = false;

  @action
  setChildbirthWithComplications(bool value) {
    childBirthWithComplications = value;

    isChanged = true;
  }

  @observable
  @JsonKey(name: 'birth_date', toJson: _birthDateToJson)
  DateTime? birthDate;

  @action
  setBirthDate(DateTime value) {
    birthDate = value;

    isChanged = true;
  }

  static String? _birthDateToJson(DateTime? date) {
    return date?.toUtc().toIso8601String();
  }

  @computed
  String get birthDateCounter {
    DateTime currentDate = DateTime.now();

    Duration difference = currentDate.difference(birthDate ?? DateTime.now());

    int months = (difference.inDays / 30).floor();
    int days = difference.inDays - (months * 30);

    int weeks = difference.inDays ~/ 7;

    String formattedDifference =
        '${t.home.months(n: months)} ${t.home.days(n: days)}';
    String formattedWeeks = t.home.weeks(n: weeks);

    return '$formattedDifference ${t.home.or} $formattedWeeks';
  }

  @observable
  @JsonKey(name: 'weight')
  double? weight;

  @action
  setWeight(double? value) {
    weight = value;

    isChanged = true;
  }

  @observable
  @JsonKey(name: 'height')
  double? height;

  @action
  setHeight(double? value) {
    height = value;

    isChanged = true;
  }

  @observable
  @JsonKey(name: 'head_circ')
  double? headCircumference;

  @action
  setHeadCircumference(double? value) {
    headCircumference = value;
    isChanged = true;
  }

  @observable
  @JsonKey(
    name: 'about',
    includeIfNull: false,
  )
  String? about;

  @action
  setAbout(String? value) {
    about = value;
    isChanged = true;
  }

  @observable
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool isChanged = false;

  @action
  setIsChanged(bool value) {
    isChanged = value;
  }
}
