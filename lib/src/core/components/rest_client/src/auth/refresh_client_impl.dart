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
    Map tokenPair = {};
    try {
      final String? token = (await tokenStorage.loadTokenPair())?['refresh'];

      restClient
          .get(
        '${const Config().apiUrl}${Endpoint().accessToken}',
        options: Options(
          headers: {'Refresh-Token': 'Bearer $token'},
          followRedirects: true,
          contentType: 'application/json',
          responseType: ResponseType.json,
        ),
      )
          .then((v) {
        tokenPair = {
          'access': v.data['access_token'],
          'refresh': v.data['refresh_token']
        };
        tokenStorage.saveTokenPair(tokenPair);
      });

      return await Future.value(tokenPair);
    } catch (e) {
      // Handle any errors that occur during the token refresh process
      log('Error refreshing token: $e');
      throw Exception('Failed to refresh token');
    }
  }
}
