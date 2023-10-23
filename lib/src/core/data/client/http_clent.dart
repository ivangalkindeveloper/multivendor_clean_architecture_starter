import 'package:multivendor_clean_architecture_starter/src/core/data/data/config/config.dart';
import 'package:dio/dio.dart';

abstract class IHttpClient {
  const IHttpClient();

  Future<Response> request({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}

class HttpClient implements IHttpClient {
  HttpClient({
    required IConfig config,
    BaseOptions? baseOptions,
    List<Interceptor>? interceptors,
  }) : this._dio = Dio(baseOptions?.copyWith(
              baseUrl: config.baseUrl,
            ) ??
            BaseOptions(
              baseUrl: config.baseUrl,
            )) {
    if (interceptors != null) {
      this._dio.interceptors.addAll(
            interceptors,
          );
    }
  }

  final Dio _dio;

  @override
  Future<Response> request({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.request(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.get(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> post({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.post(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> put({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.put(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> delete({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.delete(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
}
