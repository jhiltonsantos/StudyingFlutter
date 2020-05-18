import 'package:flutter/material.dart';
import 'package:imcalculator/constants.dart';

class BoxContains extends StatelessWidget {
  BoxContains({@required this.corCard, this.cardChild, this.onPressGender});

  final Color corCard;
  final Widget cardChild;
  final Function onPressGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressGender,
      child: Container(
        child: Material(
          elevation: 19.0,
          color: corCard,
          shadowColor: Colors.black87,
          type: MaterialType.card,
          borderRadius: BorderRadius.circular(10.0),
          child: cardChild,
        ),
        margin: EdgeInsets.all(15.0),
      ),
    );
  }
}

//decoration: BoxDecoration(
//color: corCard,
//borderRadius: BorderRadius.circular(10.0),
//),
