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
      this.avatarSource,
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
      this.goalTotalAmount);
}

final List<User> users = <User>[
  User("assets/images/1.jpeg","Henry Graves",1,"Day","12:25:14:355",24847, 972, 1429, 1751,3836, 0, 35962  ),
  User("assets/images/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355",4847, 972, 1429, 1751,3836, 10, 39962  ),
  User("assets/images/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355",14847, 972, 1429, 1751,3836, 110, 25962  ),
  User("assets/images/4.jpg", "Henry Graves", 1, "Day", "12:25:14:355",24667, 972, 1429, 1751,3836, 40, 115962  ),
  User("assets/images/5.jpg", "Johni Holmes", 1, "Day", "12:25:14:355",847, 972, 1429, 1751,3836, 540, 55962  ),
  User("assets/images/6.jpg", "Alma Simens", 1, "Day", "12:25:14:355",5847, 972, 1429, 1751,3836, 40, 65962  ),
  User("assets/images/7.jpg", "Henry Graves", 1, "Day", "12:25:14:355",2847, 972, 1429, 1751,3836, 100, 15962  ),
  User("assets/images/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355",2667, 972, 1429, 1751,3836, 770, 5962  ),
  User("assets/images/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355",11847, 972, 1429, 1751,3836, 350, 99962  ),
  User("assets/images/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355",24525, 972, 1429, 1751,3836, 40, 55962  ),
  User("assets/images/4.jpg", "Henry Graves", 1, "Day", "12:25:14:355",14847, 972, 1429, 1751,3836, 120, 315962  ),
  User("assets/images/5.jpg", "Johni Holmes", 1, "Day", "12:25:14:355",12847, 972, 1429, 1751,3836, 140, 15962  ),
  User("assets/images/6.jpg", "Alma Simens", 1, "Day", "12:25:14:355",4847, 972, 1429, 1751,3836, 90, 32962  ),
  User("assets/images/7.jpg", "Henry Graves", 1, "Day", "12:25:14:355",14847, 972, 1429, 1751,3836, 990, 25962  ),
];
