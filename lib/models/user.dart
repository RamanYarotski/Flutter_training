class User {
  String avatarSource;
  String userName;
  int number;
  String numberValue;
  String time;
  int balance;
  int expenses;
  int income;
  int goal;
  User(this.avatarSource, this.userName, this.number, this.numberValue,
      this.time, this.balance, this.expenses, this.income,  this.goal);
}

final List<User> users = <User>[
  User("assets/images/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355"),
  User("assets/images/4.jpg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/5.jpg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/6.jpg", "Alma Simens", 1, "Day", "12:25:14:355"),
  User("assets/images/7.jpg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355"),
  User("assets/images/4.jpg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User("assets/images/5.jpg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/6.jpg", "Alma Simens", 1, "Day", "12:25:14:355"),
  User("assets/images/7.jpg", "Henry Graves", 1, "Day", "12:25:14:355"),
];
