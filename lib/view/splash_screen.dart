import 'package:flutter/material.dart';
import 'package:mvvm_architecture/view_model/services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashService service = SplashService();

  @override
  void initState() {
    super.initState();
    service.checkAuthentication(context);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        Text('Splash Screen'),)
    );
  }
}
