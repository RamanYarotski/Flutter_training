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
  User("assets/images/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355")
];

void main() {
  runApp(const MyApp());
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
      home: const HomeScreen(
          // textParameter1: "Any text",
          // parameterN: primaryColor,
          ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  // final String textParameter1;
  // final Color parameterN;
  const HomeScreen({
    Key? key,
    // this.textParameter1,
    // this.parameterN
  }) : super(key: key);

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
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(users[index].avatarSource, width: 22, height: 22,),
                            Text(users[index].userName,
                                style: const TextStyle(
                                    fontSize: 12, color: gray80)),
                          ],
                        ),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(users[index].number.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: titleTextColor)),
                                      Text(users[index].numberValue.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: titleTextColor)),
                                      Text(users[index].time.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: titleTextColor)),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(users[index].number.toString(),
                                          style: const TextStyle(
                                              fontSize: 12, color: gray80)),
                                      Text(users[index].numberValue.toString(),
                                          style: const TextStyle(
                                              fontSize: 12, color: gray80)),
                                      Text(users[index].time.toString(),
                                          style: const TextStyle(
                                              fontSize: 12, color: gray80)),
                                    ],
                                  )
                                ],
                              )
                            ])
                      ]));
            }),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const Icon(Icons.menu),
        title: TextFormField(
          decoration: const InputDecoration(
              hintText: "Activity", fillColor: primaryColor, filled: true,),
          maxLines: 1,
          style: const TextStyle(fontSize: 22, color: gray100),
        ),
        actions: <Widget>[
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.more_vert, color: gray100)
          )
        ],
      ),
    );
  }
}
