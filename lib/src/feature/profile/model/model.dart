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

  ChildInfo(
    this.name,
    this.dateBirth,
    this.gender,
    this.twins,
    this.weight,
    this.height,
    this.headCircumference,
    this.birth,
    this.birthComplications,
    this.notes,
    this.image,
  );
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
        return 'Мальчик';
      case Gender.female:
        return 'Девочка';
    }
  }
}

extension BirthExtension on Birth {
  String get name {
    switch (this) {
      case Birth.natural:
        return 'Естественные';
      case Birth.cesarean:
        return 'Кесарево';
    }
  }
}