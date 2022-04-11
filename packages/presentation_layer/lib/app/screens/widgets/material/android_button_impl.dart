import 'package:flutter/material.dart';
import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';

class AndroidButtonImpl implements IButton {
  @override
  Widget render({
    required Widget child,
    required void Function()? onPressed,
  }) {
    return ElevatedButton(
      child: child,
      onPressed: onPressed,
    );
  }
}
