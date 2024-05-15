import 'package:flutter/material.dart';
import 'package:water_tracker_app/Themes/appBar_style.dart';
import 'package:water_tracker_app/Themes/textfield_decoration.dart';
import 'package:water_tracker_app/screens/home_screen.dart';

void main() {
  runApp( const WaterTrackerApp());
}

class WaterTrackerApp extends StatelessWidget {
  const WaterTrackerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Tracker App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
              appBarTheme: AppBarStyle.appBarStyle(),
              inputDecorationTheme: TextFieldDecoration.getTextField()
      ),
      home: const HomeScreen()
    );
  }
}

