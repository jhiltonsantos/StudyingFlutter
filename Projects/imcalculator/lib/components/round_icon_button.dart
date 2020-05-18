import 'dart:ffi';

import 'package:flutter/material.dart';
import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.iconChild, @required this.state});

  final IconData iconChild;
  final Function state;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(iconChild),
      onPressed: state,
      elevation: 15.0,
      shape: CircleBorder(),
      fillColor: kActiveCardColor,
      constraints: BoxConstraints.tightFor(
        width: 48.0,
        height: 48.0,
      ),
    );
  }
}
