import 'package:domain/usecase/palindrome_usecase_impl.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => PalindromeUsecaseImpl(),
  );
}
