import 'package:domain/usecase/palindrome_usecase_impl.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:presentation_layer/app/bloc/bloc_impl.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_data.dart';

abstract class PalindromeBloc extends Bloc {
  factory PalindromeBloc(PalindromeUsecaseImpl palindromeUsecase) =>
      _PalindromeBlocImpl(palindromeUsecase);

  void updateState();
  void updateCurrentInputValue(String value);
  void verifyString();
  void updateLoadingStatus({required bool loading});
}

class _PalindromeBlocImpl extends BlocImpl implements PalindromeBloc {
  final PalindromeUsecaseImpl _palindromeUsecase;
  final PalindromeData _state = PalindromeData.init();
  bool _isLoading = false;

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
      isLoading: _isLoading,
    );
  }

  @override
  void updateCurrentInputValue(String value) {
    _state.inputText = value;
    updateState();
  }

  @override
  void updateLoadingStatus({required bool loading}) {
    _isLoading = loading;
  }

  @override
  void verifyString() async {
    updateLoadingStatus(loading: true);
    updateState();

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
