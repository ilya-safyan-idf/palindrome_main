import 'package:presentation_layer/app/bloc/bloc_data.dart';

abstract class Bloc<D> {
  Stream<BlocData<D?>> get dataStream;
  bool get loadingStatus;
  void initState();
  void dispose();
}
