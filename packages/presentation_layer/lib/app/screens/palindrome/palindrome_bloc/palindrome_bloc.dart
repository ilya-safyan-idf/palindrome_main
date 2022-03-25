import 'package:domain/usecase/palindrome_usecase_impl.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:presentation_layer/app/bloc/bloc_impl.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_data.dart';

abstract class PalindromeBloc extends Bloc {
  factory PalindromeBloc(PalindromeUsecaseImpl palindromeUsecase) =>
      _PalindromeBlocImpl(palindromeUsecase);

  void updateState();
  void updateCurrentInputValue(String value);
  void updateLoadingStatus({required bool loading});
  void verifyString();
}

class _PalindromeBlocImpl extends BlocImpl implements PalindromeBloc {
  final PalindromeUsecaseImpl _palindromeUsecase;
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
      isLoading: super.loadingStatus,
    );
  }

  @override
  void updateLoadingStatus({required bool loading}) {
    super.updateLoadingStatus(loading: loading);
  }

  @override
  void updateCurrentInputValue(String value) {
    _state.inputText = value;
    updateState();
  }

  

  @override
  void verifyString() async {
    updateLoadingStatus(loading: true);

    if (_state.inputText.isEmpty) {
      _state.verifyInfo = 'Result';
      updateLoadingStatus(loading: false);
      updateState();
      return;
    }

    final bool verifyResult =
        await _palindromeUsecase(params: _state.inputText);

    _state.verifyInfo = verifyResult.toString();
    updateLoadingStatus(loading: false);
    updateState();
  }

  String get verifyResult => _state.verifyInfo;
}
