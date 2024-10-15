import 'package:fresh_dio/fresh_dio.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore extends _AuthStore with _$AuthStore {
  AuthStore({
    required super.tokenStorage,
    required super.restClient,
  });
}

abstract class _AuthStore with Store {
  final Fresh tokenStorage;
  final RestClient restClient;

  _AuthStore({
    required this.tokenStorage,
    required this.restClient,
  }) : super() {
    status = ObservableStream(tokenStorage.authenticationStatus);
  }

  @computed
  bool get isAuthorized => status.value == AuthenticationStatus.authenticated;

  @observable
  ObservableStream<AuthenticationStatus> status =
      ObservableStream(Stream.empty());
}
