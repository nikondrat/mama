import 'package:mama/src/data.dart';

extension GenderExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return t.profile.male;
      case Gender.female:
        return t.profile.female;
    }
  }
}

extension BirthExtension on Childbirth {
  String get name {
    switch (this) {
      case Childbirth.natural:
        return t.profile.nature;
      case Childbirth.cesarian:
        return t.profile.cesarean;
    }
  }
}
