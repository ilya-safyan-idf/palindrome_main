import 'package:flutter/material.dart';

abstract class IButton {
  Widget render({
    required Widget child,
    required void Function()? onPressed,
  });
}
