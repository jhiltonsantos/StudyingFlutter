import 'package:flutter/material.dart';
import 'dart:math';

class DiceHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int lefDiceNumber = 1;
  int rightDiceNumber = 2;

  void changeDiceFace() {
    setState(() {
      lefDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  Widget _diceBottom(int bottom, int otherBottom) {
    return Expanded(
      child: FlatButton(
        child: Image.asset('images/dice$bottom.png'),
        onPressed: () {
          setState(() {
            changeDiceFace();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          _diceBottom(lefDiceNumber, rightDiceNumber),
          _diceBottom(rightDiceNumber, lefDiceNumber),
        ],
      ),
    );
  }
}
