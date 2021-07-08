import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:my_library/widgets/BottomBar.dart';

import '../Constant.dart';
class DashBoard extends StatefulWidget {
  static const String id = 'dashBoard_screen';

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final fieldSelected = TextEditingController();
  final branchSelected = TextEditingController();
  List<String> fields = [
    "B.Tech",
    "M.Tech",
    "Aerospace Eng.",
    "Design"
  ];
  List<String> branch = [
    "Computer Science",
    "Mechanical",
    "Electronics",
    "IT"
  ];
  String dropdownValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: Image.asset('images/pic1.png',),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  child: Container(
                    color: Colors.green,
                    child: DropDownField(
                      hintStyle: TextStyle(color: kPrimaryColor),
                      itemsVisibleInDropdown: 4,
                      controller: fieldSelected,
                      hintText: 'Select Any Field ',
                      enabled: true,
                      items: fields,
                      onValueChanged: (value){
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  child: Image.asset('images/pic2.png'),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  child: Container(
                    color: Colors.yellow,
                    child: DropDownField(
                      hintStyle: TextStyle(color: kPrimaryColor),
                      itemsVisibleInDropdown: 4,
                      controller: branchSelected,
                      hintText: 'Select Any Field ',
                      enabled: true,
                      items: branch,
                      onValueChanged: (value){
                        setState(() {
                          dropdownValue = value;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
