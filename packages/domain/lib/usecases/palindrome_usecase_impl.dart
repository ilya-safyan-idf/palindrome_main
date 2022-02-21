import 'package:domain/usecases/models/palindrome_usecase.dart';

class PalindromeUsecaseImpl implements PalindromeUsecase {

  @override
  bool isPalindrome({required String value}) {
    final String currentString = value.toLowerCase().trim();
    final List inputValueArray = currentString.split('');
    final String reversedString = inputValueArray.reversed.join('').toLowerCase().trim();

    return currentString == reversedString;
  }
}
