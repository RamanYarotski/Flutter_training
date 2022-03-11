import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/strings.dart';
import 'package:training_project/widgets/export.dart';

extension on int {
  String toStringDollarPattern() {
    if (this > 1000) {
      return "\$${(this / 1000).toString().replaceAll(".", ",")}";
    } else {
      return "\$$this";
    }
  }
}

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({Key key, this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var headerHeight = size.height * headerHeightCoeff;
    var bodyHeight = size.height * bodyHeightCoeff;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Header(headerHeight: headerHeight, user: user),
            Body(size: size, bodyHeight: bodyHeight, user: user),
          ],
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    Key key,
    @required this.size,
    @required this.bodyHeight,
    @required this.user,
  }) : super(key: key);

  final Size size;
  final double bodyHeight;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: size.height - bodyHeight,
        ),
        SizedBox(
            width: size.width,
            height: bodyHeight,
            child: ListView(
                padding: const EdgeInsets.all(0),
                children: <Widget>[
                  FinanceCard(
                      bodyHeight: bodyHeight,
                      cardName: Strings.expenses,
                      currentParameterValue: user.expensesActual,
                      plannedParameterValue: user.expensesPlanned,
                      currentParameterName: Strings.actual,
                      plannedParameterName: Strings.planned),
                  FinanceCard(
                    bodyHeight: bodyHeight,
                    cardName: Strings.income,
                    currentParameterValue: user.incomeActual,
                    plannedParameterValue: user.incomeMonthly,
                    currentParameterName: Strings.actual,
                    plannedParameterName: Strings.monthlyIncome,
                  ),
                  FinanceCard(
                    bodyHeight: bodyHeight,
                    cardName: Strings.goal,
                    currentParameterValue: user.goalSave,
                    plannedParameterValue: user.goalTotalAmount,
                    currentParameterName: Strings.save,
                    plannedParameterName: Strings.totalAmount,
                  )
                ])),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key key,
    @required this.headerHeight,
    @required this.user,
  }) : super(key: key);

  final double headerHeight;
  final User user;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: headerHeight,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover)),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: headerHeight * appBarTitleHeightCoeff,
              ),
              Text(Strings.finance,
                  style: const TextStyle(
                      fontSize: subtitleSize,
                      color: gray100,
                      fontWeight: FontWeight.w300,
                      fontFamily: "DMSans")),
              SizedBox(
                height: headerHeight * titleHeightCoeff,
              ),
              Text(user.balance.toStringDollarPattern(),
                  style: const TextStyle(
                      fontSize: titleSize,
                      color: gray100,
                      fontWeight: FontWeight.w500,
                      fontFamily: "DMSans")),
              Text(Strings.currentBalance,
                  style: const TextStyle(
                      fontSize: subtitleSize,
                      color: gray100,
                      fontWeight: FontWeight.w300,
                      fontFamily: "DMSans")),
            ],
          ),
        ));
  }
}
