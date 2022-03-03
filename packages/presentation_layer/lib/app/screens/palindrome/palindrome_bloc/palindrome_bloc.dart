import 'package:domain/usecases/models/palindrome_usecase.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:presentation_layer/app/bloc/bloc_impl.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_data.dart';

abstract class PalindromeBloc extends Bloc {
  factory PalindromeBloc(PalindromeUsecase palindromeUsecase) =>
      _PalindromeBlocImpl(palindromeUsecase);

  void updateState();
  void updateCurrentInputValue(String value);
  void verifyString();
}

class _PalindromeBlocImpl extends BlocImpl implements PalindromeBloc {
  final PalindromeUsecase _palindromeUsecase;
  final PalindromeData _state = PalindromeData.init();

  _PalindromeBlocImpl(this._palindromeUsecase);

  @override
  void initState() {
    super.initState();
    updateState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void updateState() {
    super.handleData(
      data: _state,
    );
  }

  @override
  void updateCurrentInputValue(String value) {
    _state.inputText = value;
    updateState();
  }

  @override
  void verifyString() {
    if (_state.inputText.isEmpty) {
      _state.verifyInfo = 'Result';
      updateState();
      return;
    }

    final bool verifyResult =
        _palindromeUsecase.isPalindrome(value: _state.inputText);
    _state.verifyInfo = verifyResult.toString();
    updateState();
  }

  String get verifyResult => _state.verifyInfo;
}
