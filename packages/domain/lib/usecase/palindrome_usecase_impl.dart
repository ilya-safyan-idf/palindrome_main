import 'package:domain/usecase/usecase.dart';

class PalindromeUsecaseImpl implements Usecase<String, bool> {
  @override
  bool call({required String params}) {
    final String currentString = params.toLowerCase().trim();
    final List listFromCurrentString = currentString.split('');
    final String reversedString =
        listFromCurrentString.reversed.join('').toLowerCase().trim();
    final bool isPalidrome = currentString == reversedString;

    return isPalidrome;
  }

  @override
  void dispose() {}
}
