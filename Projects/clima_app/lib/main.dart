import 'package:climaapp/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    ),
  );
}
