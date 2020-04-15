import 'package:flutter/material.dart';

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
  int lefDiceNumber = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice1.png'),
              onPressed: () {
                return Image.asset('images/dice$lefDiceNumber.png');
              },
            ),
          ),
          Expanded(
            child: FlatButton(
              child: Image.asset('images/dice2.png'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
