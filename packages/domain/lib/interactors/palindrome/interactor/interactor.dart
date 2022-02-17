

import 'package:domain/interactors/interactors.dart';

class PalindromeInteractor implements Palindrome {

  @override
  bool palindromeChecking({required String value}) {
    final String currentString = value.toLowerCase().trim();
    final List inputValueArray = currentString.split('');
    final String reversedString = inputValueArray.reversed.join('').toLowerCase().trim();

    return currentString == reversedString;
  }
}