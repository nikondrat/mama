import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'articles.g.dart';

@JsonSerializable()
class Articles {
  final List<ArticleModel>? articles;

  Articles({this.articles});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);
}
