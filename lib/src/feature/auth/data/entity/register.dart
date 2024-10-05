import 'package:mama/src/data.dart';

class RegisterData {
  final AccountModel user;

  final ChildModel child;

  final String city;

  RegisterData({
    required this.user,
    required this.child,
    required this.city,
  });
}
