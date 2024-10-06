import 'dart:developer';

import 'package:mama/src/feature/profile/model/profile/model.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';

part 'profile_info.g.dart';

class ProfileInfo extends _ProfileInfo with _$ProfileInfo {
  ProfileInfo({
    required super.restClient,
  });
}

abstract class _ProfileInfo with Store {
  _ProfileInfo({required this.restClient});

  final RestClient restClient;

  @observable
  late ProfileModel profileInfo;

  @observable
  var isProgress = false;

  @action
  getProfileInfo() async {
    isProgress = false;
    try {
      final response = await restClient.get(
          Endpoint().userMe,
          headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiMjA1Yzg5YzYtYTE4NC00ZjEzLWJiZmMtMDU0ZmRiMGZmYmQzIiwic3RhdGUiOiJBQ1RJVkUiLCJyb2xlIjoiVVNFUiIsInN0YXR1cyI6Ik5PX1NVQlNDUklCRUQiLCJleHAiOjE3MjgyODA2NjcsImlhdCI6MTcyODIyNjY2NywiaXNzIjoiTWFtYUNvIiwic3ViIjoiYWNjZXNzIn0.jbUi-p-uv3pkUWlRF6swNfd7iTUnrIxWHBgFWKourCE'
      });

      final model = ProfileModel.fromJson(response!);
      profileInfo = model;
      isProgress = true;
    } catch (e) {
      log(e.toString());
    }
  }
}
