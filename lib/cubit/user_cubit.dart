import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/cubit/user_state.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/services/users_repository.dart';

class UserCubit extends Cubit<UserState> {
  final UsersRepository usersRepository;

  UserCubit(this.usersRepository) : super(UserEmptyState());

  Future<void> fetchUsers() async {
    try {
      emit(UserLoadingState());
      final List<User> usersList = await usersRepository.getAllUsers();
      emit(UserLoadedState(loadedUser: usersList));
    } catch (_) {
      emit(UserErrorState());
    }
  }

  Future<void> clearUsers() async {
    emit(UserEmptyState());
  }
}
