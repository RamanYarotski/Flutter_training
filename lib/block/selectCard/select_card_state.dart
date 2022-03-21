import 'package:flutter/cupertino.dart';
import 'package:training_project/constants.dart';

abstract class SelectCardState {
  final Color stateColor;
  SelectCardState(this.stateColor);
}

class SelectedCardState extends SelectCardState {
  SelectedCardState() : super(selectedColor);
}

class NotSelectedCardState extends SelectCardState {
  NotSelectedCardState() : super(notSelectedColor);
}