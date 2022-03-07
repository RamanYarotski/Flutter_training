import 'package:flutter/material.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/generated/l10n.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key? key, required this.userName}) : super(key: key);

  final String userName;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * backgroundAspectRatio,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.cover)),
          ),
          SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 12,
              ),
              Center(
                child: Text(S.of(context).finance,
                    style: const TextStyle(fontSize: 18, color: gray100)),
              )
            ],
          ))
        ],
      ),
    );
  }
}
