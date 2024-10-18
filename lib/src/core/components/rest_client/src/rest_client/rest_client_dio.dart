import 'package:dio/dio.dart';
import 'package:mama/src/data.dart';
import 'package:meta/meta.dart';

/// Rest client that uses [Dio] as HTTP library.
final class RestClientDio extends RestClientBase {
  RestClientDio({required super.baseUrl, required Dio dio}) : _dio = dio;

  final Dio _dio;

  /// Send [Dio] request
  @protected
  @visibleForTesting
  Future<Map<String, Object?>?> sendRequest<T extends Object>({
    required String path,
    required String method,
    Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    String? contentType,
  }) async {
    try {
      final uri = buildUri(path: path, queryParams: queryParams);
      final options = Options(
        headers: headers,
        method: method,
        followRedirects: true,
        contentType: contentType ?? 'application/json',
        responseType: ResponseType.json,
      );

      final response = await _dio.request<T>(
        uri.toString(),
        data: body,
        options: options,
      );

      final resp = await decodeResponse(
        response.data,
        statusCode: response.statusCode,
      );

      return resp;
    } on RestClientException {
      rethrow;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        Error.throwWithStackTrace(
          ConnectionException(
            message: 'ConnectionException',
            statusCode: e.response?.statusCode,
            cause: e,
          ),
          e.stackTrace,
        );
      }
      if (e.response != null) {
        final result = await decodeResponse(
          e.response?.data,
          statusCode: e.response?.statusCode,
        );

        return result;
      }
      Error.throwWithStackTrace(
        ClientException(
          message: e.toString(),
          statusCode: e.response?.statusCode,
          cause: e,
        ),
        e.stackTrace,
      );
    } on Object catch (e, stack) {
      Error.throwWithStackTrace(
        ClientException(message: e.toString(), cause: e),
        stack,
      );
    }
  }

  @override
  Future<Map<String, Object?>?> delete(
    String path, {
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        body: body,
        method: 'DELETE',
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> get(
    String path, {
    Map<String, Object?>? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'GET',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> patch(
    String path, {
    required Map<String, Object?> body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'PATCH',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );

  @override
  Future<Map<String, Object?>?> post(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
    String? contentType,
  }) =>
      sendRequest(
        path: path,
        method: 'POST',
        body: body,
        headers: headers,
        queryParams: queryParams,
        contentType: contentType,
      );

  @override
  Future<Map<String, Object?>?> put(
    String path, {
    required Object? body,
    Map<String, Object?>? headers,
    Map<String, Object?>? queryParams,
  }) =>
      sendRequest(
        path: path,
        method: 'PUT',
        body: body,
        headers: headers,
        queryParams: queryParams,
      );
}
