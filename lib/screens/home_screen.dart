import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
// import 'package:training_project/models/user.dart';

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
            Container(
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
            )
          ],
        ));
  }
}

// TextStyle itemTitleTextStyle =
//     const TextStyle(fontSize: 18, color: titleTextColor);
// TextStyle itemTitleTextStyleBold = const TextStyle(
//     fontSize: 18, color: titleTextColor, fontWeight: FontWeight.bold);

// TextStyle itemSubTitleTextStyle =
//     const TextStyle(fontSize: 12, color: subtitleTextColor);
// TextStyle itemSubTitleTextStyleBold =
//     const TextStyle(fontSize: 12, color: subtitleTextColor);

// Row _itemTextRow(
//     int itemIndex, TextStyle itemTextStyle, TextStyle itemSecondTextStyle) {
//   return Row(
//     // mainAxisSize: MainAxisSize.min,
//     children: [
//       Text(users[itemIndex].number.toString(), style: itemTextStyle),
//       Text(users[itemIndex].numberValue.toString(), style: itemTextStyle),
//       Text(users[itemIndex].time.toString(), style: itemSecondTextStyle),
//     ],
//   );
// }

// Widget _circleAvatar(String imageRoute) {
//   return CircleAvatar(
//     backgroundImage: AssetImage(imageRoute),
//     radius: avatarSize,
//   );
// }

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
    // bottom: const TabBar(tabs: [
    //   Tab(
    //     text: "FEED",
    //   ),
    //   Tab(
    //     text: "NOTIFICATIONS",
    //   )
    // ]),
  );
}
