import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fresh/fresh.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

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

    if (accessToken == null || refreshToken == null) {
      return null;
    }
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(refreshToken);

    final expirationDate = DateTime.fromMillisecondsSinceEpoch(0)
        .add(Duration(seconds: (decodedToken['exp'] as int?) ?? 0));
    if (DateTime.now().isAfter(expirationDate)) {
      await delete();
      return null;
    }

    return OAuth2Token(accessToken: accessToken, refreshToken: refreshToken);
  }

  @override
  Future<void> write(token) async {
    await storage.write(key: _accessToken, value: token.accessToken);
    await storage.write(key: _refreshToken, value: token.refreshToken);
  }
}
