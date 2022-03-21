import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/block/users/user_events.dart';
import 'package:training_project/block/users/user_state.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/services/users_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc(this.usersRepository) : super(UserEmptyState()) {
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _usersList = await usersRepository.getAllUsers();
        emit(UserLoadedState(loadedUser: _usersList));
      } catch (_) {
        emit(UserErrorState());
      }
    });

    on<UserClearEvent>((event, emit) async {
      emit(UserEmptyState());
    });
  }
}
