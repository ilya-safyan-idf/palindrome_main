import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation_layer/app/screens/palindrome/cubit/palindrome_cubit.dart';

class Palindrome extends StatelessWidget {
  const Palindrome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PalindromeCubit(),
      child: BlocBuilder<PalindromeCubit, PalindromeState>(
        builder: (context, state) {
          final _cubit = context.read<PalindromeCubit>();

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: TextField(
                    onChanged: _cubit.updateCurrentInputValue
                  ),
                ),
                Text(state.verifyInfo),
                ElevatedButton(
                  child: const Text('verify'),
                  onPressed: _cubit.verifyString,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}