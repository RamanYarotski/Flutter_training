class User {
  String avatarSource;
  String userName;
  int number;
  String numberValue;
  String time;
  User(this.avatarSource, this.userName, this.number, this.numberValue,
      this.time);
}

final List<User> users = <User>[
  User(
      "assets/images/avatars/1.jpeg", "Henry Graves", 1, "Day", "12:25:14:355"),
  User(
      "assets/images/avatars/2.jpeg", "Johni Holmes", 1, "Day", "12:25:14:355"),
  User("assets/images/avatars/3.jpeg", "Alma Simens", 1, "Day", "12:25:14:355")
];
