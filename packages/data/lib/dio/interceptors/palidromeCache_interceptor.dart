import 'package:dio/dio.dart';

class PalidromeCacheInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('cache interceptor_______ start');
    print(options);
    print('cache interceptor_______ end');
    return super.onRequest(options, handler);
  }
}
