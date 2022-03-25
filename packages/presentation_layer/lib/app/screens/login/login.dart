import 'package:flutter/material.dart';
import 'package:presentation_layer/app/bloc/bloc_data.dart';
import 'package:presentation_layer/app/bloc/bloc_state.dart';
import 'package:presentation_layer/app/screens/login/login_bloc/login_bloc.dart';
import 'package:presentation_layer/app/screens/login/login_bloc/login_data.dart';
import 'package:presentation_layer/utils/helpers/positioned_helper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BlocState<Login, LoginBloc> {
  @override
  void initState() {
    super.initState();
    bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: StreamBuilder<BlocData>(
            stream: bloc.dataStream,
            builder: (context, snapshot) {
              final BlocData? blocData = snapshot.data;
              final bool? screenLoadStatus = blocData?.isLoading;
              final LoginData? screenData = blocData?.data;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value) => bloc.onChange(
                          inputValue: value, inputType: TypeOfInput.login),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: screenData is LoginData
                            ? screenData.verifyLoginStatus
                            : null,
                      ),
                    ),
                    addVerticalSpace(20),
                    TextField(
                      onChanged: (value) => bloc.onChange(
                          inputValue: value, inputType: TypeOfInput.password),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: screenData is LoginData
                            ? screenData.verifyPasswordStatus
                            : null,
                      ),
                    ),
                    addExpandedSpace(),
                    screenLoadStatus is bool && screenLoadStatus == true
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            child: const Text('Login'),
                            onPressed: bloc.onLogin,
                          ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
