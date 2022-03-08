import 'package:domain/usecase/palindrome_usecase_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_bloc.dart';

void initPresentationModule() {
  _initScreenModule();
}

void _initScreenModule() {
  GetIt.I.registerFactory<PalindromeBloc>(
      () => PalindromeBloc(GetIt.I.get<PalindromeUsecaseImpl>()));
}
