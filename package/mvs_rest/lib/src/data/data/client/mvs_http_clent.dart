import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io' as io;

abstract class IMVSHttpClient {
  const IMVSHttpClient();

  Future<Response<T>> request<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response> get<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response<T>> post<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response<T>> put<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<Response<T>> delete<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}

class MVSHttpClient implements IMVSHttpClient {
  MVSHttpClient({
    required String baseUrl,
    List<String>? proxyUrls,
    BaseOptions? baseOptions,
    List<Interceptor>? interceptors,
  }) : this._dio = Dio(
          baseOptions?.copyWith(
                baseUrl: baseUrl,
              ) ??
              BaseOptions(
                baseUrl: baseUrl,
              ),
        ) {
    if (proxyUrls?.isEmpty == true) {
      this._enableProxy(
        proxyUrls!,
      );
    }
    if (interceptors?.isNotEmpty == true) {
      this._addInterceptors(
        interceptors!,
      );
    }
  }

  void _enableProxy(
    List<String> proxyUrls,
  ) {
    this._dio.httpClientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        final client = io.HttpClient();
        client.findProxy = (Uri uri) {
          final String proxyHostListString = proxyUrls
              .map(
                (
                  String proxyHost,
                ) =>
                    "PROXY $proxyHost;",
              )
              .join(" ");
          return "$proxyHostListString DIRECT";
        };
        return client;
      },
    );
  }

  void _addInterceptors(
    List<Interceptor> interceptors,
  ) {
    this._dio.interceptors.addAll(
          interceptors,
        );
  }

  final Dio _dio;

  @override
  Future<Response<T>> request<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.request<T>(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response<T>> get<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.get<T>(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response<T>> post<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.post<T>(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response<T>> put<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.put<T>(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );

  @override
  Future<Response<T>> delete<T>({
    required String endpoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) =>
      this._dio.delete<T>(
            endpoint,
            data: data,
            queryParameters: queryParameters,
            options: Options(
              headers: headers,
            ),
          );
}
