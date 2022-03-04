import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/widgets/export.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            MyTabBar(tabController: tabController),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TabBarView(controller: tabController, children: const [
                  FeedBar(),
                  Center(
                    child: Text( "NOTIFICATIONS page"),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}

AppBar buildAppBar() {
  return AppBar(
    backgroundColor: primaryColor,
    elevation: 0,
    leading: const Icon(Icons.menu),
    title: TextFormField(
      decoration: const InputDecoration(
          hintText: "Activity",
          fillColor: primaryColor,
          filled: true,
          border: InputBorder.none,
          hintStyle: TextStyle(color: gray100)),
      maxLines: 1,
      style: const TextStyle(fontSize: 22, color: gray100),
    ),
    actions: <Widget>[
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.search, color: gray100)),
      IconButton(
          onPressed: () {}, icon: const Icon(Icons.more_vert, color: gray100))
    ],
  );
}
