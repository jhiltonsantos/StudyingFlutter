import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GenderForm.dart';
import 'BoxContains.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = GenderType.male;
                      });
                    },
                    child: BoxContains(
                      cor: selectGender == GenderType.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderForm(
                          icon: FontAwesomeIcons.mars,
                          cor: Color(0xFF8D8E98),
                          gender: 'MASCULINO'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectGender = GenderType.female;
                      });
                    },
                    child: BoxContains(
                      cor: selectGender == GenderType.female
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: GenderForm(
                          icon: FontAwesomeIcons.venus,
                          cor: Color(0xFF8D8E98),
                          gender: 'FEMININO'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BoxContains(cor: Color(0xFF1D1E33)),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxContains(cor: Color(0xFF1D1E33)),
                ),
                Expanded(
                  child: BoxContains(cor: Color(0xFF1D1E33)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
