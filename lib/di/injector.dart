import 'package:presentation_layer/di/presentation_injector.dart';
import 'package:domain/di/domain_injector.dart';

Future<void> initInjector() async {
  initPresentationModule();
  initDomainModule();
}