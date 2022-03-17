import 'package:domain/model/passwordVerify_respone.dart';
import 'package:domain/model/userNameVerify_respone.dart';
import 'package:domain/repository/network_repository.dart';

class AuthRepository implements INetworkRepository {
  @override
  Future<PasswordVerifyRespone> passwordVerify(
      {required String password, required RegExp validationRule}) async {
    print(password);
    final bool verifyResult = validationRule.hasMatch(password);
    print(validationRule);
    print(verifyResult);

    await Future.delayed(Duration(seconds: 2));

    return Future.value(PasswordVerifyRespone(verifyPassword: verifyResult));
  }

  @override
  Future<UserNameVerifyRespone> userNameVerify(
      {required String login, required RegExp validationRule}) async {
    final bool verifyResult = validationRule.hasMatch(login);
    await Future.delayed(Duration(seconds: 2));

    return Future.value(UserNameVerifyRespone(verifyUserName: verifyResult));
  }
}
