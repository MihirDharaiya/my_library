import 'package:flutter/material.dart';
import 'package:my_library/screens/DashBoard.dart';
import 'package:my_library/screens/EditProfile.dart';
import 'package:my_library/screens/HomeScreen.dart';
import 'package:my_library/screens/LogIn_Page.dart';
import 'package:my_library/screens/ProfileScreen.dart';
import 'package:my_library/screens/ResetPassword.dart';
import 'package:my_library/screens/SignUp_Page.dart';
import 'package:my_library/screens/SplashScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyLibrary());
}


class MyLibrary extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     initialRoute:SplashScreen.id,
      routes: {
        SignUpPage.id:(context)=>SignUpPage(),
        LogInPage.id:(context)=>LogInPage(),
        SplashScreen.id:(context)=>SplashScreen(),
        ProfileScreen.id:(context)=>ProfileScreen(),
        ResetPassword.id:(context)=>ResetPassword(),
        EditProfile.id:(context)=>EditProfile(),
        HomeScreen.id:(context)=>HomeScreen(),
        DashBoard.id:(context)=>DashBoard(),
      },
    );
  }
}
