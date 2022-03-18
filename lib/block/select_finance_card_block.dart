import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/constants.dart';

enum SelectedEvent { selected, notSelected }

class SelectFinanceCardBlock extends Bloc<SelectedEvent, Color> {
  Color _color = notSelectedColor;

  @override
  Color get initialState => _color;

  @override
  Stream<Color> mapEventToState(SelectedEvent event) async* {
    _color =
        (event == SelectedEvent.selected) ? selectedColor : notSelectedColor;
    yield _color;
  }
}
