import 'package:flutter/material.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/screens/finance_screen.dart';
import 'package:training_project/strings.dart';
import 'package:training_project/widgets/export.dart';

class FeedBar extends StatelessWidget {
  const FeedBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox(height: 16),
        UsersManagementButtons(),
        UsersList(),
      ],
    );
  }
}

class UsersList extends StatelessWidget {
  const UsersList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const ScrollPhysics(),
        shrinkWrap: true,
        itemCount: users.length,
        itemBuilder: (context, int index) {
          final currentUser = users[index];
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
}

class UsersManagementButtons extends StatelessWidget {
  const UsersManagementButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 5,
            child: ElevatedButton(onPressed: () {}, child: Text(Strings.load))),
        const SizedBox(width: 8),
        Expanded(
            flex: 5,
            child: ElevatedButton(onPressed: () {}, child: Text(Strings.clear)))
      ],
    );
  }
}
