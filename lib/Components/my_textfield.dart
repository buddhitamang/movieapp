import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget{

  final controller;
  final String hintText;
  final bool obsecureText;
  final Icon prefixIcon;
  final String obsecuringCharacter;
  final suffixIcon;
  final keyboardType;
  // final bool suffixIcon=true;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obsecureText,
    required this.prefixIcon,
    required this.obsecuringCharacter,
    required this.suffixIcon,
    required this.keyboardType,

  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        obscuringCharacter: "*",
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent),
              borderRadius: BorderRadius.circular(12)

          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color:Colors.black),
              borderRadius: BorderRadius.circular(12)
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,





        ),
      ),
    );
  }

}