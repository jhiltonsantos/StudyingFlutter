import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'GenderForm.dart';
import 'BoxContains.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  void updateGenderBottom(int gender) {
    if (gender == 0) {
      if (maleCardColor == inactiveCardColor) {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
      }
    }
    if (gender == 1) {
      if (femaleCardColor == inactiveCardColor) {
        femaleCardColor = activeCardColor;
        maleCardColor = inactiveCardColor;
      } else {
        femaleCardColor = inactiveCardColor;
      }
    }
  }

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
                        updateGenderBottom(0);
                      });
                    },
                    child: BoxContains(
                      cor: maleCardColor,
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
                        updateGenderBottom(1);
                      });
                    },
                    child: BoxContains(
                      cor: femaleCardColor,
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
