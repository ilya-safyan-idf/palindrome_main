import 'package:flutter/material.dart';
import 'package:presentation_layer/app/screens/palindrome/palindrome.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
//2
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Palindrome(),
    );
  }
}