import 'package:flutter/material.dart';
import 'package:presentation_layer/app/bloc/bloc_data.dart';
import 'package:presentation_layer/app/bloc/bloc_state.dart';
import 'package:presentation_layer/app/screens/login/login_bloc/login_bloc.dart';
import 'package:presentation_layer/app/screens/login/login_bloc/login_data.dart';
import 'package:presentation_layer/app/screens/widgets/interface/cupertino_platform_widgets.dart';
import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';
import 'package:presentation_layer/app/screens/widgets/interface/iplatform_widgets.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';
import 'package:presentation_layer/app/screens/widgets/interface/material_platform_widgets.dart';
import 'package:presentation_layer/utils/helpers/positioned_helper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends BlocState<Login, LoginBloc> {
  final List<IPlatformWidgets> platformWidgets = [
    CupertinoPlatformWidgets(),
    MaterialPlatformWidgets(),
  ];

  int _selectedPlatformIndex = 0;

  IButton? _button;

  ISlider? _slider;
  double _sliderValue = 40.0;

  @override
  void initState() {
    super.initState();
    bloc.initState();
    _createWidgets();
  }

  void _setSliderValue(double value) {
    if (value == 0.0) {
      setState(() {
        _selectedPlatformIndex = 1;
        _createWidgets();
      });
      return;
    }

    if(value == 100.0) {
       setState(() {
        _selectedPlatformIndex = 0;
        _createWidgets();
      });
      return;
    }

    setState(() {
      _sliderValue = value;
    });
  }

  void _createWidgets() {
    _button = platformWidgets[_selectedPlatformIndex].createButton();
    _slider = platformWidgets[_selectedPlatformIndex].createSlider();
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
                        errorText: screenData?.verifyLoginStatus,
                      ),
                    ),
                    addVerticalSpace(20),
                    TextField(
                      onChanged: (value) => bloc.onChange(
                          inputValue: value, inputType: TypeOfInput.password),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        errorText: screenData?.verifyPasswordStatus,
                      ),
                    ),
                    addExpandedSpace(),
                    _slider!.render(
                      value: _sliderValue,
                      onChanged: _setSliderValue,
                    ),
                    addExpandedSpace(),
                    screenLoadStatus is bool && screenLoadStatus == true
                        ? const CircularProgressIndicator()
                        : _button!.render(
                            child: const Text('Login'),
                            onPressed: bloc.onLogin,
                          )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
