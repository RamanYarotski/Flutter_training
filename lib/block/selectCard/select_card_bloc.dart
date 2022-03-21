import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/block/selectCard/select_card_state.dart';
import 'package:training_project/block/selectCard/select_event.dart';

class SelectCardBloc extends Bloc<SelectEvent, SelectCardState> {
  SelectCardBloc() : super(NotSelectedCardState()) {
    on<SelectedEvent>((event, emit) async {
      emit(SelectedCardState());
    });

    on<NotSelectedEvent>((event, emit) async {
      emit(NotSelectedCardState());
    });
  }
}
