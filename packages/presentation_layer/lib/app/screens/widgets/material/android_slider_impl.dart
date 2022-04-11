import 'package:flutter/material.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';

class AndroidSliderImpl implements ISlider {
  @override
  Widget render({
    required double value,
    void Function(double)? onChanged,
  }) {
    return Slider(
      value: value,
      min: 0.0,
      max: 100.0,
      onChanged: onChanged,
    );
  }
}
