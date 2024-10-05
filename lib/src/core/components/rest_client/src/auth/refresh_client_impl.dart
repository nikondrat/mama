import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:mama/src/data.dart';

class RefreshClientImpl implements RefreshClient<Map?> {
  final Dio restClient;
  final TokenStorageImpl tokenStorage;

  RefreshClientImpl({required this.restClient, required this.tokenStorage});

  // final Dio _dio = Dio(); // Assuming you are using Dio for HTTP requests

  @override
  Future<Map?> refreshToken(token) async {
    try {
      final String? token = (await tokenStorage.loadTokenPair())?['refresh'];

      restClient
          .get(
        '${Config().apiUrl}${Endpoint().accessToken}',
        options: Options(
          headers: {'Refresh-Token': 'Bearer $token'},
          followRedirects: true,
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      )
          .then((v) {
        tokenStorage.saveTokenPair({
          'access': v.data['access_token'],
          'refresh': v.data['refresh_token']
        });
      });

      return await Future.value();
    } catch (e) {
      // Handle any errors that occur during the token refresh process
      log('Error refreshing token: $e');
      throw Exception('Failed to refresh token');
    }
  }
}
