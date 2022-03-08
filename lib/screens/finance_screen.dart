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
    var headerHeight = size.height * headerHeightCoeff;

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
                      Text(S.of(context).finance,
                          style: const TextStyle(
                              fontSize: subtitleSize,
                              color: gray100,
                              fontWeight: FontWeight.w300,
                              fontFamily: "DMSans")),
                      SizedBox(
                        height: headerHeight * titleHeightCoeff,
                      ),
                      Text(
                          "\$${(user.balance / 1000).toString().replaceAll(".", ",")}",
                          style: const TextStyle(
                              fontSize: titleSize,
                              color: gray100,
                              fontWeight: FontWeight.w500,
                              fontFamily: "DMSans")),
                      Text(S.of(context).currentBalance,
                          style: const TextStyle(
                              fontSize: subtitleSize,
                              color: gray100,
                              fontWeight: FontWeight.w300,
                              fontFamily: "DMSans")),
                    ],
                  ),
                )),
            // SafeArea(
            //   child: Padding(
            //     padding: EdgeInsets.only(top: headerHeight*appBarTitleHeightCoeff),
            //     child: Text(S.of(context).finance,
            //         style: const TextStyle(
            //             fontSize: subtitleSize,
            //             color: gray100,
            //             fontWeight: FontWeight.w300,
            //             fontFamily: "DMSans")),
            //   ),
            // ),
            // Positioned(
            //   top: headerHeight * titleHeightCoeff,
            //   child: Text(
            //       "\$${(user.balance / 1000).toString().replaceAll(".", ",")}",
            //       style: const TextStyle(
            //           fontSize: titleSize,
            //           color: gray100,
            //           fontWeight: FontWeight.w500,
            //           fontFamily: "DMSans")),
            // ),
            // Positioned(
            //   top: headerHeight * titleHeightCoeff +
            //       titleSize / 2 +
            //       subtitleSize * 1.5,
            //   child: Text(S.of(context).currentBalance,
            //       style: const TextStyle(
            //           fontSize: subtitleSize,
            //           color: gray100,
            //           fontWeight: FontWeight.w300,
            //           fontFamily: "DMSans")),
            // ),
            Column(
              children: [
                SizedBox(
                  height: headerHeight,
                ),
                SizedBox(
                  width: size.width,
                  height: size.height * bodyHeightCoeff,
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return const Card(
                        // color: gray70,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(3))),
                        child: Text("sadsaddfsdf"),
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
