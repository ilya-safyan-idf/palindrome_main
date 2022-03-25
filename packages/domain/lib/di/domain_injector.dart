import 'package:domain/repository/network_repository.dart';
import 'package:domain/repository/palidrome_repository.dart';
import 'package:domain/usecase/passwordVerify_usecase_impl.dart';
import 'package:domain/usecase/palindrome_usecase_impl.dart';
import 'package:domain/usecase/userNameVerify_usecase_impl.dart';
import 'package:get_it/get_it.dart';

Future<void> initDomainModule() async {
  _initUseCaseModule();
}

void _initUseCaseModule() {
  GetIt.I.registerFactory(
    () => PalindromeUsecaseImpl(GetIt.I.get<IPalidromeRepository>()),
  );

  GetIt.I.registerFactory(
    () => PasswordVerifyUsecaseImpl(GetIt.I.get<INetworkRepository>()),
  );

  GetIt.I.registerFactory(
    () => UserNameVerifyUsecaseImpl(GetIt.I.get<INetworkRepository>()),
  );
}
