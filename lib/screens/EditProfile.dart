import 'package:flutter/material.dart';
import 'package:my_library/Constant.dart';
import 'package:my_library/screens/LogIn_Page.dart';
import 'package:my_library/widgets/Button.dart';
import 'package:my_library/widgets/TextForm.dart';

class EditProfile extends StatefulWidget {
  static const String id = "edit_profile";
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: kPrimaryColor,
          ),
          SizedBox(height: 50,),
          TextForm(hint: 'Enter Your Name ',icons: Icon(Icons.person,color: kPrimaryColor),inputType:TextInputType.name , s: false,),
          TextForm(hint: 'Enter Your Email ',icons: Icon(Icons.email,color: kPrimaryColor),inputType:TextInputType.emailAddress , s: false,),
          TextForm(hint: 'Enter Your Phone No ',icons: Icon(Icons.phone,color: kPrimaryColor),inputType:TextInputType.phone , s: false,),
          Button(w:MediaQuery.of(context).size.width*0.33,h: 50,pressed: (){
            Navigator.pushNamed(context, LogInPage.id);
          },text: 'SAVE',)
        ],
      ),
    );
  }
}
