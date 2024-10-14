import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';

part 'article.g.dart';

@JsonSerializable()
class ArticleModel extends BaseModel {
  @JsonKey(name: 'id')
  final String? id;

  final String? title;

  final String? category;

  final String? file;

  @JsonKey(name: 'photo_id')
  final String? photo;

  final List<String>? tags;

  ArticleModel({
    this.id,
    this.title,
    this.category,
    this.file,
    this.photo,
    this.tags,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
