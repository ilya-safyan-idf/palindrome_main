import 'package:data/dio/interceptors/palidromeCache_interceptor.dart';
import 'package:data/service/api_service.dart';
import 'package:domain/model/palidrome_response.dart';
import 'package:domain/repository/palidrome_repository.dart';
import 'package:dio/dio.dart';

class PalidromeRepository implements IPalidromeRepository {
  final ApiService service;
  final PalidromeCacheInterceptor? interceptor;

  PalidromeRepository({required this.service, this.interceptor});

  @override
  Future<PalidromeResponse> isPalidrome({required String string}) async {
    final response;
    service.addInterceptor(interceptor: interceptor!);

    try {
      response = await service.get(path: string);
      return Future.value(
        PalidromeResponse.fromJson(response.data),
      );
    } on DioError catch (_) {
      return Future.value(
        PalidromeResponse(isPalidrome: false),
      );
    }
  }
}
