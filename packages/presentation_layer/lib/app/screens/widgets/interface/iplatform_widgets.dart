import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';

abstract class IPlatformWidgets {
  IButton createButton();
  ISlider createSlider();
}