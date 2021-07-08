import 'package:flutter/material.dart';
import 'dart:async';
import 'SignUp_Page.dart';
class SplashScreen extends StatefulWidget {
  static const String id = "splash_Screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => SignUpPage())));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('images/splash.png'),
      ),
    );
  }
}
