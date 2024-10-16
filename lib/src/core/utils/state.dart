import 'package:mobx/mobx.dart';

mixin BaseStore<T> {
  @observable
  ObservableFuture fetchArticlesFuture = emptyResponse;

  @observable
  T? data;

  static ObservableFuture emptyResponse = ObservableFuture.value(null);

  @observable
  ObservableList listData = ObservableList();

  @computed
  bool get hasResults =>
      fetchArticlesFuture != emptyResponse &&
      fetchArticlesFuture.status == FutureStatus.fulfilled;

  Future<T?> fetchData(
      Future Function() fetchFunction, Function(dynamic data) thenData) async {
    final future = fetchFunction().then((v) {
      if (v != null) {
        thenData(v);
      }
      return emptyResponse;
    });

    fetchArticlesFuture = ObservableFuture(future);
    return await future;
  }
}
