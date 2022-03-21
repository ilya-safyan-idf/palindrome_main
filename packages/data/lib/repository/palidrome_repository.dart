import 'package:data/dio/interceptors/palidromeCache_interceptor.dart';
import 'package:data/service/api_service.dart';
import 'package:domain/model/palidrome_response.dart';
import 'package:domain/repository/palidrome_repository.dart';

class PalidromeRepository implements IPalidromeRepository {
  final ApiService service;
  final PalidromeCacheInterceptor? interceptor;

  PalidromeRepository({required this.service, this.interceptor});

  @override
  Future<PalidromeResponse> isPalidrome({required String string}) async {
    final response;
    var json;
    service.setInterceptor(interceptor: interceptor!);

    try {
      response = await service.get(path: string);
      json = response.data;
    } catch (_) {
      json = {'isPalindrome': false};
    }

    final PalidromeResponse result = PalidromeResponse.fromJson(json);

    return Future.value(result);
  }
}
