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
    required this.config,
    BaseOptions? baseOptions,
  }) : this.dio = Dio(baseOptions) {
    this.dio.interceptors.addAll(
      const [
        RequestInterceptor(),
      ],
    );
  }

  final IConfig config;
  final Dio dio;

  String get _base => "${this.config.baseUrl}${this.config.apiController}";

  @override
  Future<Response> get({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this.dio.get(
            "${this._base}$endpoint",
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
      this.dio.post(
            "${this._base}$endpoint",
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
      this.dio.post(
            "${this._base}$endpoint",
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
      this.dio.post(
            "${this._base}$endpoint",
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
}
