import 'dart:math';

import 'package:training_project/constants.dart';

class User {
  String avatarSource;
  String userName;
  int number;
  String numberValue;
  String time;
  int balance;
  int expensesActual;
  int expensesPlanned;
  int incomeActual;
  int incomeMonthly;
  int goalSave;
  int goalTotalAmount;
  User(
      {this.avatarSource,
      this.userName,
      this.number,
      this.numberValue,
      this.time,
      this.balance,
      this.expensesActual,
      this.expensesPlanned,
      this.incomeActual,
      this.incomeMonthly,
      this.goalSave,
      this.goalTotalAmount});

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
      expensesPlanned: randomStartExpences + rndDigit  ,
      incomeActual: randomStartIncome,
      incomeMonthly: randomStartIncome + rndDigit,
      goalSave: randomStartSave,
      goalTotalAmount: randomStartSave + rndDigit,
    );
  }
}
