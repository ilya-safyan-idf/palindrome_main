import 'package:data/repository/auth_repository.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataModule() async {
  _initAuthRepositoryModule();
}

void _initAuthRepositoryModule() {
  GetIt.I.registerFactory<INetworkRepository>(() => AuthRepository());
}
