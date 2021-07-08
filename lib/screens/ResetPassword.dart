import 'package:flutter/material.dart';
import 'package:my_library/screens/LogIn_Page.dart';
import 'package:my_library/widgets/Button.dart';
import 'package:my_library/widgets/TextForm.dart';

import '../Constant.dart';

class ResetPassword extends StatefulWidget {
  static const String id = 'reset_password';
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Reset Your Password !!',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 50,),
            TextForm(hint: 'Enter Your Password ',icons: Icon(Icons.lock,color: kPrimaryColor),s: true,),
            TextForm(hint: 'Confirm Password ',icons: Icon(Icons.lock,color: kPrimaryColor),s: true,),
            SizedBox(height: 50,),
            Button(w:MediaQuery.of(context).size.width*0.33,h: 50,pressed: (){
              Navigator.pushNamed(context, LogInPage.id);
            },text: 'SAVE',),
          ],
        ),
      ),
    );
  }
}
