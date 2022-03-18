import 'package:training_project/models/user.dart';
import 'package:training_project/services/user_api_provider.dart';

class UserRepository{
  UserProvider _userProvider = UserProvider();
  Future<List<User>> getAllUsers()=> _userProvider.getUser();
}