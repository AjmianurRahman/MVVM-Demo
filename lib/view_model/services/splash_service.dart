import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/model/user_model.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';

class SplashService {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context)async {
    getUserData().then((value)async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(Duration(seconds: 3));
         print('NO USER');
        Navigator.pushNamed(context, RoutesName.login);
      } else {
       await Future.delayed(Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stack) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
