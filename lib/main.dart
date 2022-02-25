import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';

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
        child: const Text("Home",
            style: TextStyle(fontSize: 22, color: titleTextColor),
            textDirection: TextDirection.ltr),
      ),
      appBar: AppBar(
        title: const Text("Activity"),
      ),
    );
  }
}
