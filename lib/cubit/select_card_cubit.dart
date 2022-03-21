import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/cubit/select_card_state.dart';

class SelectCardCubit extends Cubit<SelectCardState> {
  SelectCardState currentState = NotSelectedCardState();
  SelectCardCubit() : super(NotSelectedCardState());

  Future<void> changeSelectState() async {
    (currentState is NotSelectedCardState)
        ? currentState = SelectedCardState()
        : currentState = NotSelectedCardState();
    emit(currentState);
  }
}
