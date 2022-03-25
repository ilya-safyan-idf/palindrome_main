import 'package:domain/model/userNameVerify_respone.dart';
import 'package:domain/repository/network_repository.dart';
import 'package:domain/usecase/usecase.dart';
import 'package:domain/model/login_params.dart';

class UserNameVerifyUsecaseImpl implements Usecase<LoginParams, Future<bool>> {
  final INetworkRepository _repository;

  UserNameVerifyUsecaseImpl(this._repository);

  @override
  Future<bool> call({required LoginParams params}) async {
    final UserNameVerifyRespone response = await _repository.userNameVerify(
        login: params.login, validationRule: params.validRule);

    return Future.value(response.verifyUserName);
  }

  @override
  void dispose() {}
}
