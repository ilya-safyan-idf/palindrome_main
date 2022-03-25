import 'package:dio/dio.dart';

class PalidromeCacheInterceptor extends Interceptor {
  String previous = '';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.path == previous) {
      handler.reject(
        DioError(
          error: 'Erro: Recurring Request',
          type: DioErrorType.cancel,
          requestOptions: options,
        ),
      );

      return;
    }

    previous = options.path;

    return super.onRequest(options, handler);
  }
}
