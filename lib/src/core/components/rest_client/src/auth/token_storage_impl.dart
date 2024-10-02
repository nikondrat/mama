import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mama/src/data.dart';

class TokenStorageImpl implements TokenStorage<Map?> {
  final FlutterSecureStorage storage;

  TokenStorageImpl({required this.storage});

  static const _accessTokenKey = 'access';
  static const _refreshTokenKey = 'refresh';

  @override
  Future<void> clearTokenPair() async {
    storage.delete(key: _accessTokenKey);
    storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Stream<Map?> getTokenPairStream() {
    // final controller = StreamController<Future<String?>>();

    return Stream.value({
      _accessTokenKey: storage.read(key: _accessTokenKey),
      _refreshTokenKey: storage.read(key: _refreshTokenKey)
    });

    // storage.read(key: _accessTokenKey).then((value) async {
    //   controller.add(Future.value(value));
    //   // print(value);
    //   controller.close();
    // }).catchError((error) {
    //   controller.addError(error);
    //   controller.close();
    // });
    // return controller.stream;
  }

  @override
  Future<Map?> loadTokenPair() async {
    final accessToken = storage.read(key: _accessTokenKey);
    final refreshToken = storage.read(key: _refreshTokenKey);

    return {'access': accessToken, 'refresh': refreshToken};
  }

  @override
  Future<void> saveTokenPair(tokens) async {
    final String? accessTokenString = tokens?['access'];
    final String? refreshTokenString = tokens?['refresh'];

    storage.write(key: _accessTokenKey, value: accessTokenString);
    storage.write(key: _refreshTokenKey, value: refreshTokenString);
  }
}
