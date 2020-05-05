import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'gender_form.dart';
import 'box_contains.dart';
import 'constans.dart';


enum GenderType { female, male }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType selectGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxContains(
                    onPressGender: () {
                      setState(() {
                        selectGender = GenderType.male;
                      });
                    },
                    corCard: selectGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderForm(
                        icon: FontAwesomeIcons.mars,
                        corIcon: selectGender == GenderType.male
                            ? kActiveIconColor
                            : kInactiveIconColor,
                        gender: 'MASCULINO'),
                  ),
                ),
                Expanded(
                  child: BoxContains(
                    onPressGender: () {
                      setState(() {
                        selectGender = GenderType.female;
                      });
                    },
                    corCard: selectGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: GenderForm(
                        icon: FontAwesomeIcons.venus,
                        corIcon: selectGender == GenderType.female
                            ? kActiveIconColor
                            : kInactiveIconColor,
                        gender: 'FEMININO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BoxContains(
              corCard: kInactiveCardColor,
              cardChild: Column(
                children: <Widget>[Text('ALTURA')],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxContains(corCard: kInactiveCardColor),
                ),
                Expanded(
                  child: BoxContains(corCard: kInactiveCardColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
