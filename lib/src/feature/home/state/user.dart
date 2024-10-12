import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'user.g.dart';

class UserStore extends _UserStore with _$UserStore {
  UserStore({
    required super.restClient,
  });

  get selectedChild => null;

  get user => null;

  get changedDataOfChild => null;
}

abstract class _UserStore with Store {
  final RestClient restClient;
  _UserStore({required this.restClient});

  @observable
  ObservableFuture<UserData> fetchUserDataFuture = emptyResponse;

  @observable
  UserData? userData;

  @computed
  AccountModel get account =>
      userData?.account ??
      AccountModel(
          gender: Gender.female, firstName: '', secondName: '', phone: '');

  @computed
  UserModel get user =>
      userData?.user ??
      UserModel(
        accountId: '',
        city: '',
        createdId: '',
        endPrime: '',
        id: '',
        roles: [],
        startPrime: '',
        typePrime: '',
        updatedId: '',
      );

  @computed
  bool get isChanged =>
      account.isChanged || children.where((e) => e.isChanged).isNotEmpty;

  @observable
  ObservableList<ChildModel> children = ObservableList();

  @observable
  ChildModel? selectedChild;

  @computed
  List<ChildModel> get changedDataOfChild =>
      children.where((element) => element.isChanged).toList();

  @computed
  bool get hasResults =>
      fetchUserDataFuture != emptyResponse &&
      fetchUserDataFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<UserData> emptyResponse = ObservableFuture.value(
      UserData(
          account:
              AccountModel(
                  gender: Gender.female,
                  firstName: '',
                  phone: '',
                  secondName: ''),
          childs: [],
          user: UserModel(
              accountId: '',
              city: '',
              createdId: '',
              endPrime: '',
              id: '',
              roles: [],
              startPrime: '',
              typePrime: '',
              updatedId: '')));

  @action
  void updateData({
    String? city,
    String? firstName,
    String? secondName,
    String? email,
    String? info,
  }) {
    restClient.patch('${Endpoint.user}/', body: {
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
        var selectedChild = data.childs?.first;
        final children = ObservableList.of(data.childs as Iterable);
        return data;
      }
      return emptyResponse;
    });

    fetchUserDataFuture = ObservableFuture(future);

    return userData = await future;
  }

  void updateAvatar(XFile file) {
    restClient.put(Endpoint().accountAvatar, body: {
      'avatar': MultipartFile.fromFileSync(file.path),
    }).then((v) {});
  }

  @action
  void selectChild({required ChildModel child}) {
    var selectedChild = child;
  }
}
