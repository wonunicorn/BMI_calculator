import 'package:flutter/material.dart';
import 'screens/input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

     theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF0A0E21),
       primaryColor: Color(0xFF0A0E21),
     ),

      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),

          ),
        ),
        body: InputPage(),
      ),
    );
  }
}
