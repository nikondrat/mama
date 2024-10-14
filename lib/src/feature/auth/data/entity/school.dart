import 'package:json_annotation/json_annotation.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'school.g.dart';

@JsonSerializable()
class SchoolModelStore extends _SchoolModelStore with _$SchoolModelStore {
  @JsonKey(includeToJson: false)
  final AccountModel account;

  @JsonKey(name: 'id', includeIfNull: false)
  String? id;

  @JsonKey(name: 'name')
  String name;

  SchoolModelStore({
    required this.name,
    required this.id,
    required this.account,
    required super.articleNumber,
    required super.course,
    required super.createdAt,
    required super.updatedAt,
  });

  factory SchoolModelStore.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelStoreFromJson(json);

  Map<String, dynamic> toJson() => _$SchoolModelStoreToJson(this);
}

abstract class _SchoolModelStore with Store {
  _SchoolModelStore({
    required this.articleNumber,
    required this.course,
    required this.createdAt,
    required this.updatedAt,
  });

  @observable
  @JsonKey(name: 'article number')
  int? articleNumber = 0;

  @observable
  @JsonKey(name: 'course')
  bool course = true;

  @observable
  @JsonKey(name: 'created_at')
  String createdAt = '';

  @observable
  @JsonKey(name: 'updated_at')
  String updatedAt = '';
}

@JsonSerializable()
class ArticleStore extends _ArticleStore with _$ArticleStore {
  ArticleStore(
      {required this.account,
      required this.subAccountDoctor,
      required this.subAccountOnlineSchool,
      required this.bodyArticle,
      this.status,
      required super.createdAt,
      required super.category,
      required super.countArticlesAuthor,
      required super.file,
      required super.title});

  @JsonKey(name: 'id', includeIfNull: false)
  String? id;

  @JsonKey(name: 'photo_id', includeIfNull: false)
  String? photoId;

  @JsonKey(includeToJson: false)
  final AccountModel account;

  @JsonKey(includeToJson: false)
  final SubAccountDoctor subAccountDoctor;

  @JsonKey(includeToJson: false)
  final SubAccountOnlineSchool subAccountOnlineSchool;

  @JsonKey(includeToJson: false)
  final BodyArticle bodyArticle;

  @JsonKey(name: 'status')
  final String? status;

  factory ArticleStore.fromJson(Map<String, dynamic> json) =>
      _$ArticleStoreFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleStoreToJson(this);
}

abstract class _ArticleStore with Store {
  _ArticleStore({
    required this.createdAt,
    required this.category,
    required this.countArticlesAuthor,
    required this.file,
    required this.title,
    this.tags,
    this.ageCategory,
  });

  @observable
  @JsonKey(name: 'age_category')
  List<String>? ageCategory = [];

  @action
  void setAgeCategory(List<String> value) {
    ageCategory = value;
  }

  @observable
  @JsonKey(name: 'category')
  String category = '';

  @observable
  @JsonKey(name: 'count_articles_author')
  int countArticlesAuthor = 0;

  @observable
  @JsonKey(name: 'created_at')
  String createdAt = '';

  @observable
  @JsonKey(name: 'file')
  String file = '';

  @observable
  @JsonKey(name: 'tags')
  List<String>? tags = [];

  @observable
  @JsonKey(name: 'title')
  String title = '';
}

@JsonSerializable()
class BodyArticle extends _BodyArticle with _$BodyArticle {
  BodyArticle({
    required this.payload,
    required this.type,
  });

  @JsonKey(name: 'payload')
  String payload;

  @JsonKey(name: 'type')
  String type;

  factory BodyArticle.fromJson(Map<String, dynamic> json) =>
      _$BodyArticleFromJson(json);

  Map<String, dynamic> toJson() => _$BodyArticleToJson(this);
}

abstract class _BodyArticle with Store {}

@JsonSerializable()
class SubAccountDoctor extends _SubAccountDoctor with _$SubAccountDoctor {
  SubAccountDoctor({
    required this.accountId,
    required this.id,
    required this.profession,
    required this.isConsultation,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'account_id')
  String accountId;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'is_consultation')
  bool isConsultation = true;

  @JsonKey(name: 'profession')
  String profession;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory SubAccountDoctor.fromJson(Map<String, dynamic> json) =>
      _$SubAccountDoctorFromJson(json);

  Map<String, dynamic> toJson() => _$SubAccountDoctorToJson(this);
}

abstract class _SubAccountDoctor with Store {}

@JsonSerializable()
class SubAccountOnlineSchool extends _SubAccountOnlineSchool
    with _$SubAccountOnlineSchool {
  SubAccountOnlineSchool({
    required this.accountId,
    required this.id,
    required this.name,
    this.createdAt,
    this.updatedAt,
  });

  @JsonKey(name: 'account_id')
  String accountId;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  factory SubAccountOnlineSchool.fromJson(Map<String, dynamic> json) =>
      _$SubAccountOnlineSchoolFromJson(json);

  Map<String, dynamic> toJson() => _$SubAccountOnlineSchoolToJson(this);
}

abstract class _SubAccountOnlineSchool with Store {}
