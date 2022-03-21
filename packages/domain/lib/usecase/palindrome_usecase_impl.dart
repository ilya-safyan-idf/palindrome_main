import 'package:domain/model/palidrome_response.dart';
import 'package:domain/repository/palidrome_repository.dart';
import 'package:domain/usecase/usecase.dart';

class PalindromeUsecaseImpl implements Usecase<String, Future<bool>> {
  final IPalidromeRepository _repository;

  PalindromeUsecaseImpl(this._repository);

  @override
  Future<bool> call({required String params}) async {
    final String currentString = params.toLowerCase().trim();
    final PalidromeResponse response =
        await _repository.isPalidrome(string: currentString);
    final bool isPalidrome = response.isPalidrome;

    return Future.value(isPalidrome);
  }

  @override
  void dispose() {}
}
