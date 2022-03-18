import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:training_project/block/select_finance_card_block.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/strings.dart';
import 'package:training_project/widgets/export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // SelectFinanceCardBloc _selectFinanceCardBloc =
    //     BlocProvider.of<SelectFinanceCardBloc>(context);

    return Scaffold(
        appBar: buildAppBar(),
        body: Column(
          children: [
            MyTabBar(tabController: tabController),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: TabBarView(controller: tabController, children: [
                  const FeedBar(),
                  Center(
                    child: Text(Strings.notificationsPage),
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
