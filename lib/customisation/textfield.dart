import 'package:flutter/material.dart';
class Textfield extends StatelessWidget {
  final String hintText;
  final TextStyle hintStyle;
  final Icon icon;
  final Function onChanged;
  final TextEditingController controller;
  const Textfield({ this.hintStyle,this.hintText,this.icon,this.controller,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color(0xffFFFFFF),
          filled: true,
          hintText: hintText,
          hintStyle: hintStyle,
          suffixIcon: icon,
          contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: Color(0xffDEDEDF),
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xffEBEBEC))),
          //  focusedBorder: OutlineInputBorder(borderSide: )
        ),
      ),
    );
  }
}