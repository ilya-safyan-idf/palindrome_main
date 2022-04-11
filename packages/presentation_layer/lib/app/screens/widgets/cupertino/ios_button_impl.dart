import 'package:flutter/cupertino.dart';
import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';

class IosButtonImpl implements IButton {
  @override
  Widget render({
    required Widget child,
    required void Function()? onPressed,
  }) {
    return CupertinoButton(
      child: child,
      onPressed: onPressed,
    );
  }
}