import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:presentation_layer/app/bloc/bloc_impl.dart';
import 'package:presentation_layer/app/screens/login/login_bloc/login_data.dart';
import 'package:domain/usecase/passwordVerify_usecase_impl.dart';
import 'package:domain/usecase/userNameVerify_usecase_impl.dart';
import 'package:domain/model/password_params.dart';
import 'package:domain/model/login_params.dart';
import 'package:presentation_layer/app/screens/login/model/login_values.dart';
import 'package:presentation_layer/utils/constant/verify.dart' as constants;

enum VerifyStatus { empty, filled, error }
enum TypeOfInput { login, password }

abstract class LoginBloc extends Bloc {
  factory LoginBloc(PasswordVerifyUsecaseImpl passwordVerifyUsecaseImpl,
          UserNameVerifyUsecaseImpl userNameVerifyUsecaseImpl) =>
      _LoginBlocImpl(
          passwordUsecase: passwordVerifyUsecaseImpl,
          loginUsecase: userNameVerifyUsecaseImpl);

  onVerify({required LoginValues loginValues});
  void onChange({required String inputValue, required TypeOfInput inputType});
  void updateLoadingStatus({required bool loading});
  void onLogin();
  void updateState();
}

class _LoginBlocImpl extends BlocImpl implements LoginBloc {
  final PasswordVerifyUsecaseImpl passwordUsecase;
  final UserNameVerifyUsecaseImpl loginUsecase;
  final LoginData _state = LoginData.init();

  _LoginBlocImpl({required this.passwordUsecase, required this.loginUsecase});

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
      isLoading: super.loadingStatus,
      data: _state,
    );
  }

  @override
  void updateLoadingStatus({required bool loading}) {
    super.updateLoadingStatus(loading: loading);
  }

  @override
  void onChange({required String inputValue, required TypeOfInput inputType}) {
    switch (inputType) {
      case TypeOfInput.password:
        _state.passwordValue = inputValue;
        break;
      case TypeOfInput.login:
        _state.loginValue = inputValue;
        break;
    }

    updateState();
  }

  @override
  void onLogin() async {
    updateLoadingStatus(loading: true);

    final String loginValue = _state.loginValue;
    final String passwordValue = _state.passwordValue;

    await onVerify(
      loginValues: LoginValues(
        login: loginValue,
        password: passwordValue,
      ),
    );

    updateLoadingStatus(loading: false);
  }

  @override
  onVerify({required LoginValues loginValues}) async {
    final emptyVerifyStatus = onEmpty(loginValues);

    if (emptyVerifyStatus == VerifyStatus.empty) return;

    await onBase(loginValues);
    updateState();
  }

  VerifyStatus onEmpty(LoginValues loginValues) {
    final bool verifyResult;
    final String login = loginValues.login;
    final String password = loginValues.password;

    changeLoginVerifyStatus(
      verifyResult: login.isNotEmpty,
      baseError: constants.emptyLoginError,
    );

    changePasswordVerifyStatus(
      verifyResult: password.isNotEmpty,
      baseError: constants.emptyPasswordError,
    );

    verifyResult = login.isEmpty || password.isEmpty;

    return verifyResult ? VerifyStatus.empty : VerifyStatus.filled;
  }

  // Base verify method wich use validation usecases

  Future<VerifyStatus> onBase(LoginValues loginValues) async {
    final bool verifyResult;
    final String login = loginValues.login;
    final String password = loginValues.password;

    final RegExp loginValidationRule = RegExp(constants.loginValidRule);
    final RegExp passwordValidationRule = RegExp(constants.passwordValidRule);

    final PasswordParams passwordParams =
        PasswordParams(password: password, validRule: passwordValidationRule);
    final LoginParams loginParams =
        LoginParams(login: login, validRule: loginValidationRule);

    final bool loginVerifyStatus = await loginUsecase(params: loginParams);
    final bool passwordVerifyStatus =
        await passwordUsecase(params: passwordParams);

    changeLoginVerifyStatus(
      verifyResult: loginVerifyStatus,
      baseError: constants.baseLoginError,
    );

    changePasswordVerifyStatus(
        verifyResult: passwordVerifyStatus,
        baseError: constants.basePasswordError);

    verifyResult = loginVerifyStatus || passwordVerifyStatus;

    updateState();

    return Future.value(
        verifyResult ? VerifyStatus.empty : VerifyStatus.filled);
  }

  void changePasswordVerifyStatus({
    required bool verifyResult,
    required String baseError,
  }) {
    _state.verifyPasswordStatus = verifyResult ? null : baseError;
  }

  void changeLoginVerifyStatus({
    required bool verifyResult,
    required String baseError,
  }) {
    _state.verifyLoginStatus = verifyResult ? null : baseError;
  }
}
