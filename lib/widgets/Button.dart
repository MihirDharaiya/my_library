import 'package:flutter/material.dart';
import 'package:my_library/Constant.dart';
class Button extends StatelessWidget {
  final Function pressed;
  final double h;
  final double w;
  final String text;
  Button({this.pressed,this.h,this.w,this.text});
  @override
  Widget build(BuildContext context) {
    return  ButtonTheme(
      minWidth:w,
      height: h,
      child: RaisedButton(
        elevation: 6,
        onPressed: pressed,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0))),
        child: Text(text),
        color: kPrimaryColor,
        textColor: Colors.white,
      ),
    );
  }
}

