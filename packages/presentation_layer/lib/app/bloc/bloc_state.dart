import 'package:flutter/widgets.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:get_it/get_it.dart';

abstract class BlocStateful<S extends StatefulWidget, B extends Bloc> extends State<S>{
  @protected
  final B bloc = GetIt.I.get<B>();
}

abstract class BlocStateless<B extends Bloc> extends StatelessWidget {
  @protected
  final B bloc = GetIt.I.get<B>();

  BlocStateless({Key? key}) : super(key: key);
}