import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:training_project/constants.dart';
import 'package:training_project/models/user.dart';

class UserProvider {
  Future<List<User>> getUser() async {
    final responce = await http.get(Uri.parse(usersUrl));

    if (responce.statusCode == successCode) {
        final List<dynamic> userJson = json.decode(responce.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception(loadUsersError);
    }
  }
}
