import 'package:flutter/material.dart';
import 'input.dart';

void main() => runApp(IMCCalculator());

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22), //Color(0xFF1D1F33)
        scaffoldBackgroundColor: Color(0xFF090C22),
      ),
      home: InputPage(),
    );
  }
}

