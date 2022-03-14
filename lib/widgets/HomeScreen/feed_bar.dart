import 'package:flutter/material.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/screens/finance_screen.dart';
import 'package:training_project/widgets/export.dart';

class FeedBar extends StatelessWidget {
  const FeedBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
