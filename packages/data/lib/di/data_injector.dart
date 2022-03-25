import 'package:data/dio/dio_builder.dart';
import 'package:data/dio/interceptors/palidromeCache_interceptor.dart';
import 'package:data/repository/auth_repository.dart';
import 'package:data/repository/palidrome_repository.dart';
import 'package:data/service/api_service.dart';
import 'package:dio/dio.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/repository/palidrome_repository.dart';
import 'package:get_it/get_it.dart';

Future<void> initDataModule() async {
  _initDioModule();
  _initServiceModule();
  _initRepositoryModule();
}

void _initDioModule() {
  GetIt.I.registerSingleton(
      dioBuilder(
        baseUrl: 'https://fpwebservice.herokuapp.com/ispalindrome/',
      ),
      instanceName: 'palidrome_url');

  GetIt.I.registerFactory<PalidromeCacheInterceptor>(
      () => PalidromeCacheInterceptor());
}

void _initServiceModule() {
  GetIt.I.registerSingleton(
      ApiService(GetIt.I.get<Dio>(instanceName: 'palidrome_url')));
}

void _initRepositoryModule() {
  GetIt.I.registerFactory<INetworkRepository>(() => AuthRepository());
  GetIt.I.registerFactory<IPalidromeRepository>(
    () => PalidromeRepository(
      service: GetIt.I.get<ApiService>(),
      interceptor: GetIt.I.get<PalidromeCacheInterceptor>(),
    ),
  );
}
