import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/rendering.dart';

class BallPage extends StatefulWidget {
  @override
  _BallPageState createState() => _BallPageState();
}

class _BallPageState extends State<BallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text(
          'Ask Me Anything',
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Ball(),
      ),
    );
  }
}

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int _BallImage = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        child: Center(
          child: Image.asset('images/ball$_BallImage.png'),
        ),
        onPressed: () {
          setState(() {
            _BallImage = Random().nextInt(5) + 1;
          });
        },
      ),
    );
  }
}
