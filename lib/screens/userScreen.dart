import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen ({Key? key, required this.userName}) : super(key: key);

final String userName;

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(userName),);
  }
}