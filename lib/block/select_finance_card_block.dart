import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/constants.dart';

enum SelectedEvent { selected, notSelected }

class SelectFinanceCardBlock extends Bloc<SelectedEvent, Color> {

  SelectFinanceCardBlock() : super(notSelectedColor);

  @override
  Stream<Color> mapEventToState(SelectedEvent event) async* {
   Color _color =
        (event == SelectedEvent.selected) ? selectedColor : notSelectedColor;
    yield _color;
  }
}
