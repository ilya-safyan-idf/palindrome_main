class PalindromeData {
  bool? isPalindrome;
  String verifyInfo;
  String inputText;

  PalindromeData({
    this.isPalindrome,
    required this.verifyInfo,
    required this.inputText,
  });

  factory PalindromeData.init() => PalindromeData(
    isPalindrome: null,
    verifyInfo: 'Result',
    inputText: '',
  );

  PalindromeData copy() => PalindromeData(
    isPalindrome: isPalindrome,
    verifyInfo: verifyInfo,
    inputText: inputText,
  );
}