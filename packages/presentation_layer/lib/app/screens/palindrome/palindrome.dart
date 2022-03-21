import 'package:flutter/material.dart';
import 'package:presentation_layer/app/bloc/bloc_data.dart';
import 'package:presentation_layer/app/bloc/bloc_state.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_bloc.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_data.dart';

class Palindrome extends BlocStateless<PalindromeBloc> {
  Palindrome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<BlocData>(
          stream: bloc.dataStream,
          initialData: BlocData.init(),
          builder: (context, snapshot) {
            const String verifyDefault = 'Result';
            final BlocData? blocData = snapshot.data;
            final bool? screenLoadStatus = blocData?.isLoading;
            final PalindromeData? screenData = blocData?.data;
            final String verifyResult = screenData is PalindromeData
                ? screenData.verifyInfo
                : verifyDefault;

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(onChanged: bloc.updateCurrentInputValue),
                ),
                screenLoadStatus!
                    ? const CircularProgressIndicator()
                    : Text(verifyResult),
                ElevatedButton(
                  child: const Text('verify'),
                  onPressed: bloc.verifyString,
                )
              ],
            );
          }),
    );
  }
}
