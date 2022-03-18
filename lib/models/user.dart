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

    return User(
      avatarSource: 'assets/images/1.jpeg","Henry Graves',
      userName: json['userName'],
      number: json['id'],
      numberValue: '№ ID',
      time: json['name'],
      balance: rnd.nextInt(randomMaxDigit),
      expensesActual: rnd.nextInt(randomMaxDigit),
      expensesPlanned: rnd.nextInt(randomMaxDigit),
      incomeActual: rnd.nextInt(randomMaxDigit),
      incomeMonthly: rnd.nextInt(randomMaxDigit),
      goalSave: rnd.nextInt(randomMaxDigit),
      goalTotalAmount: rnd.nextInt(randomMaxDigit),
    );
  }
}
