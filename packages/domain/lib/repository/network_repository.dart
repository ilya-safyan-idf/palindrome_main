import 'package:domain/model/passwordVerify_respone.dart';
import 'package:domain/model/userNameVerify_respone.dart';

abstract class INetworkRepository {
  Future<PasswordVerifyRespone> passwordVerify(
      {required String password, required RegExp validationRule});
  Future<UserNameVerifyRespone> userNameVerify(
      {required String login, required RegExp validationRule});
}
