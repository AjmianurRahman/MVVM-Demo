import 'package:flutter/material.dart';
import 'package:mvvm_architecture/utils/routes/routes_name.dart';
import 'package:mvvm_architecture/utils/uitls.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.home);
              },
              child: Text(
                'Go To Home Screen',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: () {
                Utils.toastMessage('This is the Toast');
              },
              child: Text(
                'Show Toast Message',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: InkWell(
              onTap: () {
                Utils.flushBarError('Flush bar message', context);
              },
              child: Text(
                'Show Flush Bar Message',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
