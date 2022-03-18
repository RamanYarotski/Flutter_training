import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:training_project/block/select_finance_card_block.dart';
import 'package:training_project/screens/home_screen.dart';
import 'package:training_project/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Demo",
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      themeMode: ThemeMode.system,
      home:  BlocProvider(
        create: (context) => SelectFinanceCardBlock(),
        child: const HomeScreen(),
      ),
    );
  }
}
