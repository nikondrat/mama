import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh/fresh.dart';

class TokenStorageImpl implements TokenStorage<OAuth2Token> {
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const _accessToken = 'access';
  static const _refreshToken = 'refresh';

  @override
  Future<void> delete() async {
    await storage.delete(key: _accessToken);
    await storage.delete(key: _refreshToken);
  }

  @override
  Future<OAuth2Token?> read() async {
    final String? accessToken = await storage.read(key: _accessToken);
    final String? refreshToken = await storage.read(key: _refreshToken);

    if (accessToken == null || refreshToken == null) return null;

    return OAuth2Token(accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  Future<void> write(token) async {
    await storage.write(key: _accessToken, value: token.accessToken);
    await storage.write(key: _refreshToken, value: token.refreshToken);
  }
}
