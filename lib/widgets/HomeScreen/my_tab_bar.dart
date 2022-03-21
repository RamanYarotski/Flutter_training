import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/strings.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key? key,
    required this.tabController,
  }) : super(key: key);

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      child: TabBar(indicatorColor: gray100, controller: tabController, tabs: [
        Tab(
          icon: Text(
            Strings.feed,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
        Tab(
          icon: Text(
            Strings.notifications,
            style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
          ),
        ),
      ]),
    );
  }
}
