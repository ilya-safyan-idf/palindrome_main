import 'package:flutter/material.dart';
import 'package:palindrome_main/di/injector.dart';
import 'package:presentation_layer/app/app.dart';

void main() async {
  await initInjector();
  runApp(const App());
}