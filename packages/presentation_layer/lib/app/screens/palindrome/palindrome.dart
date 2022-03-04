import 'package:flutter/material.dart';
import 'package:presentation_layer/app/bloc/bloc_data.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_bloc.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome_bloc/palindrome_data.dart';
import 'package:get_it/get_it.dart';

class Palindrome extends StatelessWidget {
  Palindrome({Key? key}) : super(key: key);

  final bloc = GetIt.I.get<PalindromeBloc>();

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
                Text(verifyResult),
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
