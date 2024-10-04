import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore extends _UserStore with _$UserStore {
  UserStore({
    required super.restClient,
  });
}

abstract class _UserStore with Store {
  final RestClient restClient;
  _UserStore({required this.restClient});

  @observable
  AccountModel? user;

  @observable
  List<ChildModel> children = [];

  @action
  void updateData({
    String? city,
    String? firstName,
    String? secondName,
    String? email,
    String? info,
  }) {
    restClient.patch(Endpoint.user, body: {
      if (city != null) 'city': city,
      if (firstName != null) 'first_name': firstName,
      if (secondName != null) 'second_name': secondName,
      if (email != null) 'email': email,
      if (info != null) 'info': info,
    });
  }

  @action
  void getData() {
    restClient.get(Endpoint().userData).then((v) {
      if (v != null) {
        user = AccountModel.fromJson(v['account'] as Map<String, dynamic>);

        children = (v['childs'] as List)
            .map((e) => ChildModel.fromJson(e as Map<String, dynamic>))
            .toList();
      }
    });
  }
}
