import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture/reposiitory/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/uitls.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
setLoading(true);
     _myRepo.loginApi(data).then((value) {
     setLoading(false);
     Navigator.pushNamed(context, RoutesName.home);
       Utils.successFlushBarError('Login Successful', context);

      print('SUCCESS: ' + value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      print('FAILED: ' + error.toString());
    });
  }
}
