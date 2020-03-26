import 'package:flutter/material.dart';

void main() {
  Color darkModeBG = Color.fromRGBO(18, 18, 18, 10);
  Color darkPrimary = Color.fromRGBO(187, 134, 252, 10);
  
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: darkModeBG,
        appBar: AppBar(
          title: Center(
            child: Text('Eu sou rico'),
          ),
          backgroundColor: darkPrimary,
        ),
        body: Center(
          child: Image(
            image: AssetImage('images/diamond.png')
          ),
        ),
      ),
    ),
  );
}
