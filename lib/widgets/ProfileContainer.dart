import 'package:flutter/material.dart';
import '../Constant.dart';

class ProfileContainer extends StatefulWidget {
  final Function press;
  final String text;
  ProfileContainer({this.press,this.text});
  @override
  _ProfileContainerState createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: Card(
        margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
        elevation: 6,
        child:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.text,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18.0),),
              Icon(Icons.arrow_forward)
            ],
          ),
        ),
      ),
    );
  }
}
