import 'package:presentation_layer/app/screens/widgets/cupertino/ios_button_impl.dart';
import 'package:presentation_layer/app/screens/widgets/cupertino/ios_slider_impl.dart';
import 'package:presentation_layer/app/screens/widgets/interface/ibutton.dart';
import 'package:presentation_layer/app/screens/widgets/interface/iplatform_widgets.dart';
import 'package:presentation_layer/app/screens/widgets/interface/islider.dart';

class CupertinoPlatformWidgets implements IPlatformWidgets {
  @override
  IButton createButton() {
    return IosButtonImpl();
  }

  @override
  ISlider createSlider() {
    return IosSliderImpl();
  }
}
