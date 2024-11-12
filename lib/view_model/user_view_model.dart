import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  //? Save user data
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  //? Return User data
  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    return UserModel(token: token);
  }

  //? Remove User
  Future<bool> removeUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    sp.clear();
    return true;
  }
}
