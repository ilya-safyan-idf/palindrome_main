import 'dart:io';

import 'package:dio/dio.dart';

Dio dioBuilder({required String baseUrl, Map<String, dynamic>? headers}) {
  final int timeout = 50000;
  final headersMap = headers ?? <String, dynamic>{};

  headersMap[HttpHeaders.userAgentHeader] =
      '${Platform.operatingSystem}-APPLICATION'.toUpperCase();

  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: timeout,
    receiveTimeout: timeout,
    sendTimeout: timeout,
    headers: headersMap,
    contentType: 'application/json',
    responseType: ResponseType.json,
  );

  final Dio dio = Dio(options);
  dio.interceptors.add(LogInterceptor());

  return dio;
}