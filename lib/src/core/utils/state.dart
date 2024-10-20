import 'package:mobx/mobx.dart';

mixin BaseStore<T> {
  @observable
  ObservableFuture fetchFuture = emptyResponse;

  @observable
  T? data;

  static ObservableFuture emptyResponse = ObservableFuture.value(null);

  @observable
  ObservableList listData = ObservableList();

  @computed
  bool get hasResults =>
      fetchFuture != emptyResponse &&
      fetchFuture.status == FutureStatus.fulfilled;

  @action
  Future<T?> fetchData(
      Future fetchFunction, Function(dynamic data) thenData) async {
    final future = fetchFunction.then((v) {
      if (v != null) {
        return thenData(v);
      }
      return emptyResponse;
    });

    fetchFuture = ObservableFuture(future);
    return await future;
  }
}
