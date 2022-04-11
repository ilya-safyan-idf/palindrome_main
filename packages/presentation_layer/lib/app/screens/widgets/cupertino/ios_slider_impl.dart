import 'package:flutter/cupertino.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';

class IosSliderImpl implements ISlider {
  @override
  Widget render({
    required double value,
    void Function(double)? onChanged,
  }) {
    return CupertinoSlider(
      value: value,
      min: 0.0,
      max: 100.0,
      onChanged: onChanged,
    );
  }
}
