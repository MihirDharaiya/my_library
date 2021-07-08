import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_library/Constant.dart';
import 'package:my_library/screens/ResetPassword.dart';
import 'package:my_library/widgets/BottomBar.dart';
import 'package:my_library/widgets/Button.dart';
import 'package:my_library/widgets/ProfileContainer.dart';
import 'EditProfile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  static const String id = "profile_screen";
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('users').snapshots();
  var userDetails;
  String myName;
  String myEmail;
  @override
  void initState(){
    super.initState();

  }

  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomBar(),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 40,
                        backgroundColor: kPrimaryColor,
                    ),
                  ),
                  // FutureBuilder(
                  //   future: Provider.of(context).auth.getCurrentUser(),
                  //     builder: (context,snapshot){
                  //       if(snapshot.connectionState == ConnectionState.done){
                  //         return Text('${snapshot.data}');
                  //       }
                  //       else{
                  //         return CircularProgressIndicator();
                  //       }
                  //     }),
                  SizedBox(height: 23,),
                  RaisedButton(
                    onPressed: (){
                      Navigator.pushNamed(context, EditProfile.id);
                    },
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text('Edit Profile'),
                    color: kPrimaryColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 30,),
                  ProfileContainer(text: 'Issued Books',),
                  SizedBox(height: 10,),
                  ProfileContainer(text: 'Change Password',press: (){
                    Navigator.pushNamed(context, ResetPassword.id);
                  },),
                  SizedBox(height: 10,),
                  ProfileContainer(text: 'Privacy Policy',),
                  SizedBox(height: 10,),
                  ProfileContainer(text: 'Requested Books',),
                  SizedBox(height: 10,),
                  ProfileContainer(text: 'Help',),
                  SizedBox(height: 10,),
                  ProfileContainer(text: 'Rate Application',),
                  SizedBox(height: 40,),
                  Button(w:MediaQuery.of(context).size.width*0.33,h: 50,pressed: (){
                  },text: 'LOG OUT',),
                ],
              ),
            ),
          ),
      ),
    );
  }
  _fetch() async{
    final firebaseUser =  FirebaseAuth.instance.currentUser;
    if(firebaseUser != null){
      await FirebaseFirestore.instance.collection('users').doc(firebaseUser.uid).get().then((ds){
        myName = ds.data('full_name') as String;
        myEmail = ds.data('Email') as String;
      });
    }
  }
}

// Container(
// child: StreamBuilder<QuerySnapshot>(
// stream: _usersStream,
// builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
// if (snapshot.hasError) {
// return Text('Something went wrong');
// }
// if (snapshot.connectionState == ConnectionState.waiting) {
// return Text("Loading");
// }
// return new ListView(
// children: snapshot.data.docs.map((DocumentSnapshot document) {
// Map<String, dynamic> data = document.data() as Map<String, dynamic>;
// return new ListTile(
// title: new Text(data['full_name']),
// subtitle: new Text(data['Email']),
// );
// }).toList(),
// );
// },
// ),
// ),
