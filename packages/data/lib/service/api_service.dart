import 'package:dio/dio.dart';

abstract class ApiService {
  factory ApiService(Dio dio) => _ApiService(dio);

  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  });

  setInterceptor({required Interceptor interceptor});
}

class _ApiService implements ApiService {
  final Dio _dio;

  _ApiService(this._dio);

  @override
  setInterceptor({required Interceptor interceptor}) {
    _dio.interceptors.add(interceptor);
  }

  @override
  Future<Response<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    ProgressCallback? onReceiveProgress,
  }) =>
      _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
}
