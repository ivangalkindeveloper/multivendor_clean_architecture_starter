import 'package:multi_vendor_starter/src/core/data/client/interceptor/request_interceptor.dart';
import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:dio/dio.dart';

abstract class IApiClient {
  const IApiClient();

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

class ApiClient implements IApiClient {
  ApiClient({
    required IConfig config,
    BaseOptions? baseOptions,
  })  : this._config = config,
        this._dio = Dio(baseOptions) {
    this._dio.interceptors.addAll(
      const [
        RequestInterceptor(),
      ],
    );
  }

  final IConfig _config;
  final Dio _dio;

  @override
  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.get(
            "${this._config.baseUrl}$endpoint",
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
            "${this._config.baseUrl}$endpoint",
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
            "${this._config.baseUrl}$endpoint",
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
            "${this._config.baseUrl}$endpoint",
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
}
