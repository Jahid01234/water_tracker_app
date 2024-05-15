
import 'package:flutter/material.dart';

class AppBarStyle{

  static AppBarTheme appBarStyle(){
    return const AppBarTheme(
          backgroundColor: Colors.teal,
          centerTitle: true,
          elevation: 5.0,
          //foregroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          )
    );
  }

}