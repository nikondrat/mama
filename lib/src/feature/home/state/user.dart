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
  ObservableFuture<UserData> fetchUserDataFuture = emptyResponse;

  @observable
  UserData? userData;

  @computed
  bool get hasResults =>
      fetchUserDataFuture != emptyResponse &&
      fetchUserDataFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<UserData> emptyResponse = ObservableFuture.value(
      UserData(
          account: AccountModel(
              gender: Gender.female, firstName: '', phone: '', secondName: ''),
          childs: []));

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
  Future<UserData> getData() async {
    final Future<UserData> future =
        restClient.get(Endpoint().userData).then((v) {
      if (v != null) {
        final data = UserData.fromJson(v);
        return data;
      }
      return emptyResponse;
    });

    fetchUserDataFuture = ObservableFuture(future);

    return userData = await future;
  }
}
