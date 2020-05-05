import 'package:flutter/material.dart';
import 'constans.dart';

TextStyle labelTextStyle(Color cor) {
  return TextStyle(fontSize: 18.0, color: cor);
}

class GenderForm extends StatelessWidget {
  GenderForm(
      {@required this.icon, @required this.corIcon, @required this.gender});

  final IconData icon;
  final Color corIcon;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 75.0,
          color: corIcon,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          gender,
          style: labelTextStyle(corIcon),
        )
      ],
    );
  }
}
