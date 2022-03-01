import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';

class User {
  String avatarSource;
  String userName;
  int number;
  String numberValue;
  String time;
  User(this.avatarSource, this.userName, this.number, this.numberValue,
      this.time);
}

final List<User> users = <User>[
  User(
      "assets/images/avatars/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User(
      "assets/images/avatars/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/avatars/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355")
];

void main() {
  runApp(const MyApp());
}

class HomeScreen extends StatelessWidget {
  // final String textParameter1;
  // final Color parameterN;
  HomeScreen({
    Key? key,
    // this.textParameter1,
    // this.parameterN
  }) : super(key: key);

  TextStyle itemTitleTextStyle =
      const TextStyle(fontSize: 18, color: titleTextColor);
  TextStyle itemTitleTextStyleBold = const TextStyle(
      fontSize: 18, color: titleTextColor, fontWeight: FontWeight.bold);

  TextStyle itemSubTitleTextStyle =
      const TextStyle(fontSize: 12, color: subtitleTextColor);
  TextStyle itemSubTitleTextStyleBold =
      const TextStyle(fontSize: 12, color: subtitleTextColor);

  Row _itemTextRow(
      int itemIndex, TextStyle itemTextStyle, TextStyle itemSecondTextStyle) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(users[itemIndex].number.toString(), style: itemTextStyle),
        Text(users[itemIndex].numberValue.toString(), style: itemTextStyle),
        Text(users[itemIndex].time.toString(), style: itemSecondTextStyle),
      ],
    );
  }

  Widget _circleAvatar(String imageRoute) {
    return CircleAvatar(
      backgroundImage: AssetImage(imageRoute),
      radius: avatarSize,
    );
  }

  Widget _circleAvatar2(String imageRoute) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      margin: const EdgeInsets.all(4),
      child: Image.asset(
        imageRoute,
        width: 80,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _circleAvatar3(String imageRoute) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imageRoute), fit: BoxFit.fill),
        color: Colors.white,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _circleAvatar4(String imageRoute) {
    return CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SizedBox(
            width: 60,
            height: 60,
            child: ClipOval(
              child: Image.asset(imageRoute),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: backgroundColor,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8),
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _circleAvatar4(users[index].avatarSource),
                            Text(users[index].userName,
                                style: const TextStyle(
                                    fontSize: 12, color: gray80)),
                          ],
                        )),
                        // Expanded(child: 
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _itemTextRow(index, itemTitleTextStyleBold,
                                  itemTitleTextStyle),
                              const Spacer(),
                              _itemTextRow(index, itemSubTitleTextStyleBold,
                                  itemSubTitleTextStyle),
                            ],
                          ),
                        // ),
                        // Expanded(child: 
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.more_vert))
                            ],
                          ),
                        // )
                      ]));
            }),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
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
              onPressed: () {},
              icon: const Icon(Icons.more_vert, color: gray100))
        ],
        // bottom: const TabBar(tabs: [
        //   Tab(
        //     text: "FEED",
        //   ),
        //   Tab(
        //     text: "NOTIFICATIONS",
        //   )
        // ]),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Roboto",
          scaffoldBackgroundColor: backgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: titleTextColor)),
      home: HomeScreen(
          // textParameter1: "Any text",
          // parameterN: primaryColor,
          ),
    );
  }
}
