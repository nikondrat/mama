import 'package:mama/src/core/core.dart';

class ChildInfo {
  final String name;
  final String? image;
  final DateTime dateBirth;
  final Gender gender;
  final bool twins;
  final double? weight;
  final int? height;
  final int? headCircumference;
  final Birth birth;
  final bool birthComplications;
  final String? notes;

  ChildInfo({
    required this.name,
    required this.dateBirth,
    required this.gender,
    required this.twins,
    this.weight,
    this.height,
    this.headCircumference,
    required this.birth,
    required this.birthComplications,
    this.notes,
    this.image,
  });
}

class MomInfo {
  final String name;
  final String? image;
  final String phone;
  final String? mail;
  final String? notes;
  final List<ChildInfo> childs;

  MomInfo(
    this.name,
    this.phone,
    this.mail,
    this.notes,
    this.image,
    this.childs,
  );
}

enum Gender {
  female,
  male,
}

enum Birth {
  natural,
  cesarean,
}

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return t.profile.boy;
      case Gender.female:
        return t.profile.girl;
    }
  }
}

extension BirthExtension on Birth {
  String get name {
    switch (this) {
      case Birth.natural:
        return t.profile.nature;
      case Birth.cesarean:
        return t.profile.cesarean;
    }
  }
}
