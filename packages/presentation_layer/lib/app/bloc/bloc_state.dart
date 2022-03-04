import 'package:flutter/widgets.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BlocState<S extends StatefulWidget, B extends Bloc> extends State<S>{
  @protected
  final B bloc = GetIt.I.get<B>();
}