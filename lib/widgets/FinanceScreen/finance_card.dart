import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:training_project/block/select_finance_card_block.dart';
import 'package:training_project/constants.dart';

extension on int {
  String toStringDollarPattern() {
    return (this > 1000)
        ? "\$${(this / 1000).toString().replaceAll(".", ",")}"
        : "\$$this";
  }
}

TextStyle financeItemSubtitleTextStyle =
    const TextStyle(fontSize: 13, color: gray50, fontWeight: FontWeight.w600);

class FinanceCard extends StatefulWidget {
  final double bodyHeight;
  final String cardName;
  final int currentParameterValue;
  final int plannedParameterValue;
  final String currentParameterName;
  final String plannedParameterName;

  const FinanceCard({
    Key key,
    @required this.bodyHeight,
    @required this.cardName,
    @required this.currentParameterValue,
    @required this.plannedParameterValue,
    @required this.currentParameterName,
    @required this.plannedParameterName,
  }) : super(key: key);

  @override
  _FinanceCardState createState() => _FinanceCardState();
}

class _FinanceCardState extends State<FinanceCard> {
  _FinanceCardState();

  final SelectFinanceCardBlock _selectFinanceCardBlock =
      SelectFinanceCardBlock();

  @override
  void dispose() {
    _selectFinanceCardBlock.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var proportionOfProgress =
        widget.currentParameterValue / widget.plannedParameterValue;
    var progressPercent = (proportionOfProgress * 100).round();

    return StreamBuilder(
      stream: _selectFinanceCardBlock.selectStateStream,
      initialData: notSelectedColor,
      builder: (context, snapshot) {
        return GestureDetector(
          onTap: () {
            _selectFinanceCardBlock.selectEventSink.add(
                (snapshot.data == notSelectedColor)
                    ? SelectedState.selected
                    : SelectedState.notSelected);
          },
          child: Card(
            color: snapshot.data,
            margin: const EdgeInsets.symmetric(
                vertical: financeItemMargin, horizontal: financeItemMargin * 2),
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  financeItemPadding,
                  financeItemPadding,
                  financeItemPadding * half,
                  financeItemPadding * 1.5),
              height:
                  widget.bodyHeight / financeItemsCount - financeItemMargin * 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TitleRow(cardName: widget.cardName),
                    ValueRow(
                        currentParameterValue: widget.currentParameterValue,
                        plannedParameterValue: widget.plannedParameterValue,
                        currentParameterName: widget.currentParameterName,
                        plannedParameterName: widget.plannedParameterName),
                    ProgressRow(
                        progressPercent: progressPercent,
                        proportionOfProgress: proportionOfProgress)
                  ]),
            ),
          ),
        );
      },
    );
  }
}

class ProgressRow extends StatelessWidget {
  const ProgressRow({
    Key key,
    @required this.progressPercent,
    @required this.proportionOfProgress,
  }) : super(key: key);

  final int progressPercent;
  final double proportionOfProgress;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LinearPercentIndicator(
          padding: const EdgeInsets.all(0),
          lineHeight: indicatorHeight,
          backgroundColor: gray84,
          animation: true,
          linearGradient: const LinearGradient(colors: <Color>[lilac, blue]),
          curve: Curves.linear,
          animateFromLastPercent: true,
          animationDuration: 1500,
          center: Text(
            "${progressPercent.toString()}%",
            style: const TextStyle(color: black1, fontSize: indicatorHeight),
          ),
          width: MediaQuery.of(context).size.width -
              financeItemPadding * 2 -
              financeItemMargin * 2 -
              5,
          barRadius: const Radius.circular(indicatorHeight * half),
          percent: proportionOfProgress,
        ),
        // ),
      ],
    );
  }
}

class ValueRow extends StatelessWidget {
  const ValueRow({
    Key key,
    @required this.currentParameterValue,
    @required this.plannedParameterValue,
    @required this.currentParameterName,
    @required this.plannedParameterName,
  }) : super(key: key);

  final int currentParameterValue;
  final int plannedParameterValue;
  final String currentParameterName;
  final String plannedParameterName;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 8,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  currentParameterValue.toStringDollarPattern(),
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.w600),
                ),
                Text(
                  plannedParameterValue.toStringDollarPattern(),
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600, color: gray50),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                currentParameterName,
                style: financeItemSubtitleTextStyle,
              ),
              Text(plannedParameterName, style: financeItemSubtitleTextStyle),
            ])
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Container(
          height: buttonsSize,
          width: buttonsSize,
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: lilac, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 2)),
          ]),
          child: const Icon(
            Icons.add,
            color: gray100,
          ),
        ),
      ),
    ]);
  }
}

class TitleRow extends StatelessWidget {
  const TitleRow({
    Key key,
    @required this.cardName,
  }) : super(key: key);

  final String cardName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cardName,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        IconButton(
          padding: EdgeInsets.zero,
          splashRadius: 20,
          iconSize: 26,
          onPressed: () {},
          icon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            // size: 26,
            color: gray70,
          ),
        ),
      ],
    );
  }
}
