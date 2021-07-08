import 'package:flutter/material.dart';
import 'package:my_library/Constant.dart';
class TextForm extends StatefulWidget {
  final String hint;
  final Widget icons;
  final TextInputType inputType;
  final bool s;
  final Function press;
  final Function validate;
  final Key key;

  TextForm({this.hint,this.icons,this.inputType,this.s,this.press,this.validate,this.key});
  @override
  _TextFormState createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 20,right: 20.0,bottom: 20.0),
        elevation: 5,
        child: TextFormField(
          validator: widget.validate,
          onChanged: widget.press,
          obscureText: widget.s,
          keyboardType: widget.inputType,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.hint,
            prefixIcon: widget.icons,
            hintStyle: TextStyle(color: kTextColor),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
    );
  }
}
