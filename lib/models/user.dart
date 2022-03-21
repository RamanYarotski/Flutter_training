import 'dart:math';

import 'package:training_project/constants.dart';

class User {
  final String avatarSource;
  final String userName;
  final int number;
  final String numberValue;
  final String time;
  final int balance;
  final int expensesActual;
  final int expensesPlanned;
  final int incomeActual;
  final int incomeMonthly;
  final int goalSave;
  final int goalTotalAmount;
  User(
      {required this.avatarSource,
      required this.userName,
      required this.number,
      required this.numberValue,
      required this.time,
      required this.balance,
      required this.expensesActual,
      required this.expensesPlanned,
      required this.incomeActual,
      required this.incomeMonthly,
      required this.goalSave,
      required this.goalTotalAmount});

  factory User.fromJson(Map<String, dynamic> json) {
    var rnd = Random();
    var rndDigit = rnd.nextInt(10000);

    return User(
      avatarSource: 'assets/images/1.jpeg',
      userName: json['username'],
      number: json['id'],
      numberValue: '№ ID',
      time: json['name'],
      balance: rnd.nextInt(randomMaxBalance),
      expensesActual: randomStartExpences,
      expensesPlanned: randomStartExpences + rndDigit,
      incomeActual: randomStartIncome,
      incomeMonthly: randomStartIncome + rndDigit,
      goalSave: randomStartSave,
      goalTotalAmount: randomStartSave + rndDigit,
    );
  }
}
