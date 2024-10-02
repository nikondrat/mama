import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mama/src/data.dart';

class RefreshClientImpl implements RefreshClient<String?> {
  final Dio restClient;
  final TokenStorageImpl tokenStorage;

  RefreshClientImpl({required this.restClient, required this.tokenStorage});

  // final Dio _dio = Dio(); // Assuming you are using Dio for HTTP requests

  @override
  Future<String?> refreshToken(token) async {
    try {
      restClient.get(Endpoint().accessToken,
          queryParameters: {'Refresh-Token': 'Bearer $token'}).then((v) {
        tokenStorage.saveTokenPair({'access': v.data['access']});
      });
      // Make a POST request to your token refresh endpoint
      // final response = await _dio.post(
      //   '${Config().apiUrl}/refresh-token',
      //   data: {'token': token},
      // );

      // tokenStorage.clearTokenPair();

      // Assuming your API responds with the new token in the 'newToken' key
      // final newToken = response.data['access'];

      return await Future.value();
    } catch (e) {
      // Handle any errors that occur during the token refresh process
      log('Error refreshing token: $e');
      throw Exception('Failed to refresh token');
    }
  }
}
