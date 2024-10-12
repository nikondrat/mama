import 'package:json_annotation/json_annotation.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel {
  @JsonKey()
  final String body;

  @JsonKey()
  final String description;

  @JsonKey()
  final String title;

  StatusModel({required this.body, 
    required this.description, 
    required this.title});

  factory StatusModel.fromJson(Map<String, dynamic> json) =>
      _$StatusModelFromJson(json);

  /// Connect the generated [_$StatusModelFromJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$StatusModelToJson(this);

  @override
  String toString() {
    return 'StatusModel{body: $body, description: $description, title: $title}';
  }
}
