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
      elevation: 7.0,
      shape: CircleBorder(),
      fillColor: kInactiveIconColor,
      constraints: BoxConstraints.tightFor(
        width: 46.0,
        height: 46.0,
      ),
    );
  }
}
