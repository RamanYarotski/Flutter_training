import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/block/user_events.dart';
import 'package:training_project/block/user_state.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/services/users_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;
  UserBloc(this.usersRepository) : super(UserEmptyState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
