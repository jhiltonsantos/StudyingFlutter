import 'package:flutter/material.dart';

class ButtonWelcome extends StatelessWidget {
  final Color color;
  final Function onTap;
  final String text;

  ButtonWelcome({this.text, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
                color:
                Color(0xFF010101)),
          ),
        ),
      ),
    );
  }
}
