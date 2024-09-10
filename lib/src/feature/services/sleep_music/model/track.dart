import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'track.g.dart';

@JsonSerializable()
class TrackModel extends _TrackModel with _$TrackModel {
  @JsonKey(name: 'name')
  final String id;

  final String title;

  final String description;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final String author;

  final String duration;

  @JsonKey(name: 'created_at')
  final DateTime createdAt;

  TrackModel({
    required this.id,
    required this.title,
    required this.description,
    required this.author,
    required this.duration,
    required this.createdAt,
  });
}

abstract class _TrackModel with Store {
  @observable
  bool isPlaying = false;

  @action
  void toggleIsPlaying() => isPlaying = !isPlaying;
}
