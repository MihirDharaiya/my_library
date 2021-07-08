import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_library/screens/ProfileScreen.dart';
import 'package:my_library/widgets/Button.dart';
import 'package:my_library/Constant.dart';
import 'package:my_library/widgets/TextForm.dart';

import 'DashBoard.dart';
class LogInPage extends StatefulWidget {
  static const String id = 'logInPage';
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(20.0),
                    child: Image.asset('images/library.png',width:MediaQuery.of(context).size.width*0.5,height: MediaQuery.of(context).size.height*0.4),
                  ),
                  SizedBox(height:40,),
                  TextForm(
                    press: (value){
                    email = value;
                        },
                    hint: 'Enter Your Email ',icons: Icon(Icons.email_outlined,color: kPrimaryColor),inputType:TextInputType.emailAddress , s: false,),
                  TextForm(
                    press: (value){
                      password = value;
                    },
                    hint: 'Enter Your Password ',icons: Icon(Icons.lock_outline,color: kPrimaryColor),s: true,),
                  SizedBox(height:60,),
                  Button(w:MediaQuery.of(context).size.width*0.33,h: 50,pressed: () async {
                    try{
                      final newUser  = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(newUser!= null){
                        Navigator.pushNamed(context, ProfileScreen.id);
                      }
                    }
                    catch(e){
                      print(e);
                    }

                  },text: 'LOG IN',),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
