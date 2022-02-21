part of 'palindrome_cubit.dart';

enum PalindromeStatus {
  initial,
}

class PalindromeState extends Equatable {
  final PalindromeStatus status;
  final String verifyInfo;
  final String inputText;

  const PalindromeState({
    required this.status,
    required this.verifyInfo,
    required this.inputText,
  });

  @override
  List<Object> get props => [status, inputText, verifyInfo];

  PalindromeState copyWith({
    PalindromeStatus? status,
    String? inputText,
    String? verifyInfo,
  }){
    return PalindromeState(
      status: status ?? this.status,
      inputText: inputText ?? this.inputText,
      verifyInfo: verifyInfo ?? this.verifyInfo,
    );
  }
}


