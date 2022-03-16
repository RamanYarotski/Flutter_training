import 'dart:async';
import "package:flutter/material.dart";
import 'package:training_project/constants.dart';

enum SelectedState { selected, notSelected }

class SelectFinanceCardBlock {
  Color _selectColor = notSelectedColor;

  final _selectEventController = StreamController<SelectedState>();
  StreamSink<SelectedState> get selectEventSink => _selectEventController.sink;

  final _selectStateController = StreamController<Color>();
  Stream<Color> get selectStateStream => _selectStateController.stream;

  void _mapEventToState(SelectedState selectedState) {
    (selectedState == SelectedState.selected)
        ? _selectColor = selectedColor
        : _selectColor = notSelectedColor;

    _selectStateController.sink.add(_selectColor);
  }

  SelectFinanceCardBlock() {
    _selectEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _selectEventController.close();
    _selectStateController.close();
  }
}
