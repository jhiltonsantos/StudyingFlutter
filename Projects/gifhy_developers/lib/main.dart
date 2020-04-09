import 'package:flutter/material.dart';
import 'package:gifhydevelopers/pages/home.dart';
import 'colors.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        hintColor: Colors.white,
      ),
    ),
  );
}
