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
  final Childbirth birth;
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
  final List<ChildModel> childs;

  MomInfo(
    this.name,
    this.phone,
    this.mail,
    this.notes,
    this.image,
    this.childs,
  );
}
