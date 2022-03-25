import 'package:domain/model/palidrome_response.dart';

abstract class IPalidromeRepository {
  Future<PalidromeResponse> isPalidrome({required String string});
}
