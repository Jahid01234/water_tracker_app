import 'package:flutter/material.dart';

class TextFieldDecoration{
  static InputDecorationTheme getTextField(){
    return const InputDecorationTheme(
          contentPadding: EdgeInsets.all(5.0),
          labelStyle: TextStyle(color: Colors.teal,fontSize: 14,fontWeight: FontWeight.bold),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan)
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan,width: 2)
          )
    );
  }
}