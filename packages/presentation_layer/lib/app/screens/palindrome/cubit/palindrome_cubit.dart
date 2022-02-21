

import 'package:bloc/bloc.dart';
import 'package:domain/usecases/palindrome_usecase_impl.dart';
import 'package:equatable/equatable.dart';


part 'palindrome_state.dart';

class PalindromeCubit extends Cubit<PalindromeState> {
  final PalindromeUsecaseImpl _palindromeUsecase = PalindromeUsecaseImpl();

  PalindromeCubit() : super(
    const PalindromeState(
      status: PalindromeStatus.initial,
      verifyInfo: 'Result',
      inputText: ''
    )
  );

  void updateCurrentInputValue(String value) {

    emit(state.copyWith(
      inputText: value
    ));
  }

  void verifyString() {
    if(state.inputText.isEmpty) {
      emit(state.copyWith(
        verifyInfo: 'Result'
      ));

      return;
    }

    final bool verifyResult = _palindromeUsecase.isPalindrome(value: state.inputText);

    emit(state.copyWith(
      verifyInfo: verifyResult.toString(),
    ));
  }
}
