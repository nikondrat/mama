import 'package:dio/dio.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'child.g.dart';

class ChildStore extends _ChildStore with _$ChildStore {
  ChildStore({
    required super.restClient,
  });
}

abstract class _ChildStore with Store {
  _ChildStore({required this.restClient});

  final RestClient restClient;

  void add({
    required ChildModel model,
    // required String name,
    // required double weight,
    // required double height,
    // required double headCirc,
  }) {
    restClient.post(
      Endpoint.child, body: model.toJson(),

      // {
      //   'first_name': name,
      //   'weight': weight,
      //   'height': height,
      //   'head_circ': headCirc,
      // }
    );
  }

  void update({required ChildModel model}) {
    restClient.patch(Endpoint.child, body: model.toJson());
  }

  void updateAvatar({required String id, required String path}) {
    restClient.patch(Endpoint().childAvatar, body: {
      'child_id': id,
      'avatar': MultipartFile.fromFileSync(path),
    });
  }

  void deleteAvatar({required String id}) {
    restClient.delete(Endpoint().childAvatar, body: {
      'child_id': id,
    });
  }

  void delete({required String id}) {
    restClient.get(Endpoint.child, body: {'child_id': id});
  }
}
