import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';
import '../components/widgets.dart';

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
                child: TabBarView(controller: tabController, children: [
                  Center(
                    child: Column(children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, int index) {
                          final currentUser = users[index];
                          return Card(
                              margin: const EdgeInsets.only(top: 16),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        _circleAvatar(currentUser.avatarSource),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          currentUser.userName,
                                          style: userNameTextStyle,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        _itemTextRow(
                                            currentUser,
                                            itemTitleTextStyleBold,
                                            itemTitleTextStyle),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        _itemTextRow(
                                            currentUser,
                                            itemSubTitleTextStyleBold,
                                            itemSubTitleTextStyle),
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        iconSize: 22,
                                        alignment: Alignment.topRight,
                                        padding: EdgeInsets.zero,
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.more_vert,
                                          color: gray70,
                                        )),
                                  ],
                                ),
                              ));
                        },
                      )
                    ]),
                  ),
                  const Center(
                    child: Text("NOTIFICATIONS page"),
                  )
                ]),
              ),
            )
          ],
        ));
  }
}

TextStyle userNameTextStyle =
    const TextStyle(fontSize: 8, color: subtitleTextColor);

TextStyle itemTitleTextStyle = const TextStyle(fontSize: 18);
TextStyle itemTitleTextStyleBold =
    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

TextStyle itemSubTitleTextStyle =
    const TextStyle(fontSize: 12, color: subtitleTextColor);
TextStyle itemSubTitleTextStyleBold = const TextStyle(
    fontSize: 12, color: subtitleTextColor, fontWeight: FontWeight.bold);

Row _itemTextRow(
    User currentUser, TextStyle itemTextStyle, TextStyle itemSecondTextStyle) {
  return Row(
    children: [
      Text(currentUser.number.toString(), style: itemTextStyle),
      const SizedBox(
        width: 4,
      ),
      Text(currentUser.numberValue.toString(), style: itemTextStyle),
      const SizedBox(
        width: 4,
      ),
      Text(currentUser.time.toString(), style: itemSecondTextStyle),
    ],
  );
}

Widget _circleAvatar(String imageRoute) {
  return CircleAvatar(
    backgroundImage: AssetImage(imageRoute),
    radius: avatarSize,
  );
}

// Widget _circleAvatar2(String imageRoute) {
//   return Container(
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//     ),
//     margin: const EdgeInsets.all(4),
//     child: Image.asset(
//       imageRoute,
//       width: 80,
//       fit: BoxFit.cover,
//     ),
//   );
// }

// Widget _circleAvatar3(String imageRoute) {
//   return Container(
//     decoration: BoxDecoration(
//       image: DecorationImage(image: AssetImage(imageRoute), fit: BoxFit.fill),
//       color: Colors.white,
//       shape: BoxShape.circle,
//     ),
//   );
// }

// Widget _circleAvatar4(String imageRoute) {
//   return CircleAvatar(
//       backgroundColor: Colors.transparent,
//       child: SizedBox(
//           width: 60,
//           height: 60,
//           child: ClipOval(
//             child: Image.asset(imageRoute),
//           )));
// }

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
