import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Center(
          child: Text(
            'Dice App',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.white12,
      body: DiceHome(),
    ),
  ));
}
