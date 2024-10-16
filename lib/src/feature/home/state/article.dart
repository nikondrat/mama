import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'article.g.dart';

class ArticleStore extends _ArticleStore with _$ArticleStore {
  ArticleStore({
    required super.restClient,
  });
}

abstract class _ArticleStore with Store, BaseStore<ArticlesData> {
  final RestClient restClient;

  _ArticleStore({required this.restClient});

  Future fetchAll() async {
    return await fetchData(
        () => restClient.get(Endpoint().articles, queryParams: {
              'limit': '10',
            }), (v) {
      final data = ArticlesData.fromJson(v);
      listData = ObservableList.of(data.articles ?? []);
      return data;
    });
  }

  @observable
  ObservableList<ArticleModel> listForMe = ObservableList<ArticleModel>();

  @action
  Future fetchForMe(String accountId) async {
    return await fetchData(
        () => restClient.get(Endpoint().articles, queryParams: {
              'account_id': accountId,
              'limit': '10',
            }), (v) {
      final data = ArticlesData.fromJson(v);
      listForMe = ObservableList.of(data.articles ?? []);
      return data;
    });
  }
}
