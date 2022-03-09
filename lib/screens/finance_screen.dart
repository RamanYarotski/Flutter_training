import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';
import 'package:training_project/strings.dart';

extension on int {
  String toStringDollarPattern() {
    return "\$${(this / 1000).toString().replaceAll(".", ",")}";
  }
}

TextStyle financeItemSubtitleTextStyle =
    const TextStyle(fontSize: 16, color: gray50, fontWeight: FontWeight.w500);

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
            Container(
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
                )),

            Column(
              children: [
                SizedBox(
                  height: size.height - bodyHeight,
                ),
                SizedBox(
                  width: size.width,
                  height: bodyHeight,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 3,
                    itemBuilder: ((context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: financeItemMargin,
                            horizontal: financeItemMargin * 2),
                        elevation: 4,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(6))),
                        child: Container(
                          padding: const EdgeInsets.all(financeItemPadding),
                          height: bodyHeight / financeItemsCount -
                              financeItemMargin * 2,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Strings.expenses,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_right_rounded,
                                      color: gray70,
                                      size: 26,
                                    )
                                  ],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            user.expensesActual
                                                .toStringDollarPattern(),
                                            style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            Strings.actual,
                                            style: financeItemSubtitleTextStyle,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            user.expensesPlanned
                                                .toStringDollarPattern(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                                color: gray50),
                                          ),
                                          Text(Strings.planned,
                                              style:
                                                  financeItemSubtitleTextStyle),
                                        ],
                                      )
                                    ]),
                              ]),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            // height: size.height * bodyHeightCoeff,
            // width: size.width,
            // decoration: const BoxDecoration(color: gray30),
            // child: const Text(
            //   "sdasd",
            // ),
            // height: double.infinity,
            // width: double.infinity,
            // )
            //  ListView.builder(
            //   itemCount: 3,
            //   shrinkWrap: true,
            //   itemBuilder: ((context, index) {
            //     return  Card(
            //       color: gray70,
            //       elevation: 2,
            //       // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(3))),
            //       child:  Padding(padding:  EdgeInsets.all(4), child: Text("sadsaddfsdf") ,),
            //     );
            //   }),
            //    )
            // ),
          ],
        ),
      ),
    );
  }
}
