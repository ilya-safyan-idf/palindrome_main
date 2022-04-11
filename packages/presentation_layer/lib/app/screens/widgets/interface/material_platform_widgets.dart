import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';
import 'package:presentation_layer/app/screens/widgets/interface/iplatform_widgets.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';
import 'package:presentation_layer/app/screens/widgets/material/android_button_impl.dart';
import 'package:presentation_layer/app/screens/widgets/material/android_slider_impl.dart';

class MaterialPlatformWidgets implements IPlatformWidgets {
  @override
  IButton createButton() {
    return AndroidButtonImpl();
  }

  @override
  ISlider createSlider() {
    return AndroidSliderImpl();
  }
}
