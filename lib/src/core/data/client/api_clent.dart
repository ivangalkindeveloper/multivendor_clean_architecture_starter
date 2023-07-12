import 'package:multi_vendor_starter/src/core/data/data/config/config.dart';
import 'package:dio/dio.dart';

abstract class IApiClient {
  const IApiClient();

  Future<Response> get({
    required String path,
    Map<String, dynamic>? headers,
  });

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  });

  Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  });

  Future<Response> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  });
}

class ApiClient implements IApiClient {
  ApiClient({
    required this.config,
    BaseOptions? baseOptions,
  }) : this.dio = Dio(baseOptions);

  final IConfig config;
  final Dio dio;

  @override
  Future<Response> get({
    required String path,
    Map<String, dynamic>? headers,
  }) =>
      this.dio.get(
            path,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  }) =>
      this.dio.post(
            path,
            data: data,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> put({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  }) =>
      this.dio.post(
            path,
            data: data,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response> delete({
    required String path,
    Object? data,
    Map<String, dynamic>? headers,
  }) =>
      this.dio.post(
            path,
            data: data,
            options: Options(
              headers: headers,
            ),
          );
}
