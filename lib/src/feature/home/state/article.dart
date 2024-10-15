import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'article.g.dart';

class ArticleStore extends _ArticleStore with _$ArticleStore {
  ArticleStore({
    required super.restClient,
  });
}

abstract class _ArticleStore with Store {
  final RestClient restClient;

  _ArticleStore({required this.restClient});
  @observable
  ObservableFuture<ArticlesData> fetchArticlesFuture = emptyResponse;

  @observable
  ArticlesData? articlesData;

  @observable
  ObservableList<ArticleModel> articles = ObservableList();

  @computed
  bool get hasResults =>
      fetchArticlesFuture != emptyResponse &&
      fetchArticlesFuture.status == FutureStatus.fulfilled;

  static ObservableFuture<ArticlesData> emptyResponse =
      ObservableFuture.value(ArticlesData(articles: []));

  Future<ArticlesData> fetchArticles() async {
    final Future<ArticlesData> future =
        restClient.get(Endpoint().articles).then((v) {
      if (v != null) {
        final data = ArticlesData.fromJson(v);
        articles = ObservableList.of(data.articles ?? []);
        return data;
      }
      return emptyResponse;
    });

    fetchArticlesFuture = ObservableFuture(future);

    return articlesData = await future;
  }
}
