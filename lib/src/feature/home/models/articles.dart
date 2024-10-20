import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'articles.g.dart';

@JsonSerializable()
class ArticlesData {
  final List<ArticleModel>? articles;

  ArticlesData({this.articles});

  factory ArticlesData.fromJson(Map<String, dynamic> json) =>
      _$ArticlesDataFromJson(json);

  Map<String, dynamic> toJson() => _$ArticlesDataToJson(this);
}
