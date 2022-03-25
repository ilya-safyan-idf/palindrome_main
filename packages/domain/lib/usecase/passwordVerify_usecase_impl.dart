import 'package:domain/model/passwordVerify_respone.dart';
import 'package:domain/model/password_params.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/usecase.dart';

class PasswordVerifyUsecaseImpl
    implements Usecase<PasswordParams, Future<bool>> {
  final INetworkRepository _repository;

  PasswordVerifyUsecaseImpl(this._repository);

  @override
  Future<bool> call({required PasswordParams params}) async {
    final PasswordVerifyRespone response = await _repository.passwordVerify(
        password: params.password, validationRule: params.validRule);

    return Future.value(response.verifyPassword);
  }

  @override
  void dispose() {}
}
