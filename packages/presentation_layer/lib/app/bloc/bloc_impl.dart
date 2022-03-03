import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:presentation_layer/app/bloc/bloc.dart';
import 'package:presentation_layer/app/bloc/bloc_data.dart';

class BlocImpl<D> implements Bloc<D> {
  final _streamController = StreamController<BlocData<D?>>();
  final _blocData = BlocData.init();

  @override
  Stream<BlocData<D?>> get dataStream => _streamController.stream;

  @override
  void initState() {}

  @override
  void dispose() {
    _streamController.close();
  }

  @protected
  void handleData({
    bool? isLoading,
    D? data,
  }) {
    if (!_streamController.isClosed) {
      _blocData.updateParams(
        isLoading: isLoading,
        data: data,
      );
      _streamController.add(_blocData.copy<D>());
    }
  }
}
