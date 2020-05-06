import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  int height = 160;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'ALTURA',
                    style: labelTextStyle(kInactiveIconColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kTextStyleBiggest,
                      ),
                      Text(
                        'cm',
                        style: labelTextStyle(kInactiveIconColor),
                      )
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.toInt();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: BoxContains(
                    corCard: kInactiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'PESO',
                          style: labelTextStyle(kInactiveIconColor),
                        ),
                        Text(
                          weight.toString(),
                          style: kTextStyleBiggest,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              backgroundColor: kInactiveIconColor,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            FloatingActionButton(
                              backgroundColor: kInactiveIconColor,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
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
