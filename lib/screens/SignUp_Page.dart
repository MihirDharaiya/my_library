import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Constant.dart';
import 'package:my_library/screens/DashBoard.dart';
import 'package:my_library/screens/ProfileScreen.dart';
import 'package:my_library/widgets/TextForm.dart';
import '../widgets/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class SignUpPage extends StatefulWidget {
  static const String id = 'signUp_page';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String _email;
  String _password;
  String _confirmPassword;
  String _name;
  int _number;
  final _formKey  = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                      Container(
                        margin: EdgeInsets.all(20.0),
                          child: Image.asset('images/library.png',width:MediaQuery.of(context).size.width*0.6,height: MediaQuery.of(context).size.height*0.2),
                      ),
                    Text('My Library',style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold,fontSize: 30),),
                    SizedBox(height:87,),
                    TextForm(
                      press: (value){
                        setState(() {
                          _name = value;
                        });
                      },
                      validate: (value){
                        if(value.isEmpty)
                          return 'Empty';
                        return null;
                      },
                      hint: 'Enter Your Name ',icons: Icon(Icons.person_outline,color: kPrimaryColor,),
                      s: false,

                    ),
                    TextForm(
                      press: (value){
                        setState(() {
                          _email = value;
                        });
                      },
                      validate: (value){
                        if(value.isEmpty)
                          return 'Empty';
                        return null;
                      },
                      hint: 'Enter Your Email ',icons: Icon(Icons.email_outlined,color: kPrimaryColor),inputType:TextInputType.emailAddress , s: false,),
                    TextForm(
                      press: (value){
                       setState(() {
                         _password = value;
                       });
                      },
                      validate: (value){
                        if(value.isEmpty)
                          return 'Empty';
                        return null;
                      },
                      hint: 'Enter Your Password ',icons: Icon(Icons.lock_outline,color: kPrimaryColor),s: true,),
                    TextForm(
                      press: (value){
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                      validate: (value){
                        if(value.isEmpty)
                          return 'Empty';
                        if(value != _password)
                          return 'Not Match';
                        return null;
                      },
                      hint: 'Confirm Password',icons: Icon(Icons.lock_outline,color: kPrimaryColor),s: true,),
                    TextForm(
                      press: (value){
                        setState(() {
                          _number = value;
                        });
                      },
                      validate: (value){
                        if(value.isEmpty)
                          return 'Empty';
                        return null;
                      },
                      hint: 'Enter Your Phone No',icons: Icon(Icons.phone_outlined,color: kPrimaryColor),inputType: TextInputType.phone, s: false,),
                    SizedBox(height:60,),
                    Button(
                      w:MediaQuery.of(context).size.width*0.33,h: 50,
                      pressed: () async {
                        if(_formKey.currentState.validate()){
                          try{
                            final newUser  = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
                            var firebaseUser = FirebaseAuth.instance.currentUser;
                             FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).set({
                               'full_name': _name,
                              'Email': _email,
                              'phone_number': _number
                            });
                            if(newUser!= null){
                              Navigator.pushNamed(context, ProfileScreen.id);
                            }
                          }
                          catch(e){
                            print(e);
                          }
                        }
                        },text: 'SIGN UP',),
                  ],
                ),
              ),
            ),
          ),
      ),
    );
  }
}
