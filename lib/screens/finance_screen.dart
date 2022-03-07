import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/generated/l10n.dart';
import 'package:training_project/models/user.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var backgroundHeight = size.height * backgroundAspectRatio;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Container(
              height: backgroundHeight,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/background.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: Positioned(
                top: backgroundHeight * 0.15,
                child: Text(S.of(context).finance,
                    style: const TextStyle(
                        fontSize: 18,
                        color: gray100,
                        fontWeight: FontWeight.w300,
                        fontFamily: "DMSans")),
              ),
            ),
            Positioned(
              top: backgroundHeight * 0.33,
              child: Text(
                  "\$${(user.balance / 1000).toString().replaceAll(".", ",")}",
                  style: const TextStyle(
                      fontSize: 34,
                      color: gray100,
                      fontWeight: FontWeight.w500,
                      fontFamily: "DMSans")),
            ),
            Positioned(
              top: backgroundHeight * 0.33 + 17 + 18 + 9,
              child: Text(S.of(context).currentBalance,
                  style: const TextStyle(
                      fontSize: 18,
                      color: gray100,
                      fontWeight: FontWeight.w300,
                      fontFamily: "DMSans")),
            )
          ],
        ),
      ),
    );
  }
}
