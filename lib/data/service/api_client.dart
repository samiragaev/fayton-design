import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:fayton_design/data/endpoint/api_endpoints.dart';
import 'package:fayton_design/data/exception/app_exception.dart';
import 'package:fayton_design/data/service/api_interceptors.dart';
import 'package:fayton_design/data/service/token_storage.dart';
import 'package:flutter/foundation.dart';

typedef JsonParser<T> = T Function(dynamic json);

final class ApiClient {
  ApiClient({
    required TokenStorage tokenStorage,
    required Connectivity connectivity,
    Dio? dio,
  }) : _dio = dio ?? Dio() {
    _dio.options = BaseOptions(
      baseUrl: ApiEndpoints.baseUrl,
      connectTimeout: ApiEndpoints.connectTimeout,
      receiveTimeout: ApiEndpoints.receiveTimeout,
      sendTimeout: ApiEndpoints.sendTimeout,
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
      headers: const {Headers.acceptHeader: Headers.jsonContentType},
    );

    _dio.interceptors.addAll([
      ConnectivityInterceptor(connectivity),
      AuthInterceptor(tokenStorage),
      if (kDebugMode)
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          logPrint: (object) => debugPrint(object.toString()),
        ),
    ]);
  }

  final Dio _dio;

  Future<T> get<T>(
    String path, {
    required JsonParser<T> parser,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
        options: _options(requiresAuth),
        cancelToken: cancelToken,
      ),
      parser,
    );
  }

  Future<T> post<T>(
    String path, {
    required JsonParser<T> parser,
    Object? data,
    Map<String, dynamic>? queryParameters,
    bool requiresAuth = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.post<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: _options(requiresAuth),
        cancelToken: cancelToken,
      ),
      parser,
    );
  }

  Future<T> put<T>(
    String path, {
    required JsonParser<T> parser,
    Object? data,
    bool requiresAuth = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.put<dynamic>(
        path,
        data: data,
        options: _options(requiresAuth),
        cancelToken: cancelToken,
      ),
      parser,
    );
  }

  Future<T> delete<T>(
    String path, {
    required JsonParser<T> parser,
    Object? data,
    bool requiresAuth = true,
    CancelToken? cancelToken,
  }) {
    return _request(
      () => _dio.delete<dynamic>(
        path,
        data: data,
        options: _options(requiresAuth),
        cancelToken: cancelToken,
      ),
      parser,
    );
  }

  Options _options(bool requiresAuth) =>
      Options(extra: {AuthInterceptor.skipAuthKey: !requiresAuth});

  Future<T> _request<T>(
    Future<Response<dynamic>> Function() request,
    JsonParser<T> parser,
  ) async {
    final Response<dynamic> response;
    try {
      response = await request();
    } on DioException catch (exception, stackTrace) {
      Error.throwWithStackTrace(
        AppException.fromDioException(exception),
        stackTrace,
      );
    }

    try {
      return parser(response.data);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(const ParseException(), stackTrace);
    }
  }
}
