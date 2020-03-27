import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color darkBG = Color.fromRGBO(18, 18, 18, 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBG,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Center(
          child: Text(
            'I am Astronaut',
            style: TextStyle(color: darkBG),
          ),
        ),
      ),
      body: Container(
        child: Image.asset(
          'images/pluto-searching.png',
          width: 170,
          height: 250,
        ),
        alignment: Alignment.topLeft,
        padding: EdgeInsets.only(left: 20),
      ),
      
    );
  }
}
