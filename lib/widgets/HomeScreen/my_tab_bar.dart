import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';

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
      child: TabBar(
          indicatorColor: gray100,
          controller: tabController,
          tabs: const [
            Tab(
              icon: Text(
                "FEED",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ),
            Tab(
              icon: Text(
                "NOTIFICATIONS",
                style: TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14),
              ),
            ),
          ]),
    );
  }
}