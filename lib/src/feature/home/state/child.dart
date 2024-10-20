import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mama/src/data.dart';
import 'package:mobx/mobx.dart';

part 'child.g.dart';

class ChildStore extends _ChildStore with _$ChildStore {
  ChildStore({
    required super.restClient,
    required super.userStore,
  });
}

abstract class _ChildStore with Store {
  _ChildStore({
    required this.restClient,
    required this.userStore,
  });

  final RestClient restClient;
  final UserStore userStore;

  void add({
    required ChildModel model,
    // required String name,
    // required double weight,
    // required double height,
    // required double headCirc,
  }) {
    restClient
        .post(
      '${Endpoint.child}/', body: model.toJson(),

      // {
      //   'first_name': name,
      //   'weight': weight,
      //   'height': height,
      //   'head_circ': headCirc,
      // }
    )
        .then((v) {
      userStore.children.add(model);
    });
  }

  void update({required ChildModel model}) {
    restClient.patch('${Endpoint.child}/', body: model.toJson()).then((v) {
      userStore.children
          .firstWhere((v) => v.id == model.id)
          .setIsChanged(false);
    });
  }

  void updateAvatar({required XFile file, required String id}) {
    FormData formData = FormData.fromMap({
      'child_id': id,
      'avatar': MultipartFile.fromFileSync(file.path, filename: file.name),
    });

    restClient.put('${Endpoint().childAvatar}/', body: formData);
  }

  void deleteAvatar({required String id}) {
    restClient.delete(Endpoint().childAvatar, body: {
      'child_id': id,
    });
  }

  @action
  void delete({required String id}) {
    restClient.delete('${Endpoint.child}/', body: {'child_id': id}).then((v) {
      userStore.children.removeWhere((element) => element.id == id);
    });
  }
}
