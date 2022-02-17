import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class Palindrome extends StatefulWidget {
  const Palindrome({Key? key}) : super(key: key);

  @override
  State<Palindrome> createState() => _PalindromeState();
}

class _PalindromeState extends State<Palindrome> {
  final PalindromeInteractor _palindromeInteractor = PalindromeInteractor();
  String _verifyInfo = 'Result';
  String _currentInputValue = '';

  void _updateCurrentInputValue(String value) {
    setState(() {
      _currentInputValue = value;
    });
  }

  void _verifyString() {
    if(_currentInputValue == 'Result') return;
  
    if(_currentInputValue.isEmpty) {
      setState(() {
        _verifyInfo = 'Result';
      });

      return;
    }

    final bool verifyResult = _palindromeInteractor.palindromeChecking(value: _currentInputValue);

    setState(() {
      _verifyInfo = verifyResult.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: TextField(
              onChanged: _updateCurrentInputValue,
            ),
          ),
          Text(_verifyInfo),
          ElevatedButton(
            child: const Text('verify'),
            onPressed: _verifyString,
          )
        ],
      ),
    );
  }
}