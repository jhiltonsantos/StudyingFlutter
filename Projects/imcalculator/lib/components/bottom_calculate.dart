import 'package:flutter/material.dart';
import '../constants.dart';

class BottomCalculate extends StatelessWidget {

  BottomCalculate({@required this.onTapFunction, @required this.buttonText});

  final Function onTapFunction;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: kBottomNavigationBarHeight,
      ),
    );
  }
}
