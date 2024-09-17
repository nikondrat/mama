import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mama/src/data.dart';

class TokenStorageImpl implements TokenStorage<String?> {
  final FlutterSecureStorage storage;

  TokenStorageImpl({required this.storage});

  static const _accessTokenKey = 'access';
  // static const _refreshTokenKey = 'refresh';

  @override
  Future<void> clearTokenPair() async {
    storage.delete(key: _accessTokenKey);
    // storage.delete(key: _refreshTokenKey);
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Stream<String?> getTokenPairStream() {
    // final controller = StreamController<Future<String?>>();
    return storage.read(key: _accessTokenKey).asStream();

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
  Future<String?> loadTokenPair() async {
    final accessToken = storage.read(key: _accessTokenKey);
    return accessToken;
  }

  @override
  Future<void> saveTokenPair(accessToken) async {
    final String? accessTokenString = accessToken;

    storage.write(key: _accessTokenKey, value: accessTokenString);
  }
}
