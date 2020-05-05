import 'package:flutter/material.dart';

class GenderForm extends StatelessWidget {
  GenderForm({@required this.icon, @required this.cor, @required this.gender});

  final IconData icon;
  final Color cor;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 75.0,
          color: cor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: TextStyle(fontSize: 16.0, color: cor),
        )
      ],
    );
  }
}