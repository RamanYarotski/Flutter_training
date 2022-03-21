import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/cubit/user_cubit.dart';
import 'package:training_project/cubit/user_state.dart';
import 'package:training_project/screens/finance_screen.dart';
import 'package:training_project/services/users_repository.dart';
import 'package:training_project/strings.dart';
import 'package:training_project/widgets/export.dart';

class FeedBar extends StatelessWidget {
  FeedBar({
    Key key,
  }) : super(key: key);
  final usersRepository = UsersRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => UserCubit(usersRepository),
      child: Column(
        children: const [
          SizedBox(height: 16),
          UsersManagementButtons(),
          UsersList(),
        ],
      ),
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: const [
              Text(
                "Press load to loading users",
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        );
      }

      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(color: primaryColor),
        );
      }

      if (state is UserLoadedState) {
        return Expanded(
          child: ListView.builder(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.loadedUser.length,
            itemBuilder: (context, int index) {
              final currentUser = state.loadedUser[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => FinanceScreen(
                              user: currentUser,
                            ))),
                child: UserCard(
                  currentUser: currentUser,
                ),
              );
            },
          ),
        );
      }
      if (state is UserErrorState) {
        return const Center(
          child: Text("Error loading users"),
        );
      } else {
        return const Center(
          child: Text("Unknown state"),
        );
      }
    });
  }
}

class UsersManagementButtons extends StatelessWidget {
  const UsersManagementButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserCubit userCubit = context.watch<UserCubit>();
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 5,
            child: ElevatedButton(
                onPressed: () {
                  userCubit.fetchUsers();
                },
                child: Text(Strings.load))),
        const SizedBox(width: 8),
        Expanded(
            flex: 5,
            child: ElevatedButton(
                onPressed: () {
                  userCubit.clearUsers();
                },
                child: Text(Strings.clear)))
      ],
    );
  }
}
