import 'package:mama/src/data.dart';

class ProfileItem {
  final Profile user;
  final ProfileViewStore store;
  final AccountModel accountModel;

  ProfileItem({
    required this.user,
    required this.store,
    required this.accountModel,
  });
}

enum Profile { mom, specialist, school }
