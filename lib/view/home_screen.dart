import 'package:flutter/material.dart';
import 'package:mvvm_architecture/res/components/rountd_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferance = Provider.of<UserViewModel>(context);
    return Scaffold(
        body: Center(
      child: RoundButton(
          title: 'Logout',
          loading: false,
          onPress: () {
            userPreferance
                .removeUser()
                .then((value) {
                  Navigator.pushNamed(context, RoutesName.login);
            })
                .onError((error, stack) {});
          }),
    ));
  }
}
