import 'package:flutter/material.dart';
import 'package:imcalculator/components/bottom_calculate.dart';
import 'package:imcalculator/constants.dart';
import '../components/box_contains.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.imcResult,
      @required this.resultText,
      @required this.interpretation});

  final String imcResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMC Calculadora',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Seu Resultado',
                style: kTitleStyleResult,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: BoxContains(
              corCard: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    imcResult,
                    style: kIMCTextStyle,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Text(
                      interpretation,
                      style: kIMCBodyStyle,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomCalculate(
            onTapFunction: () {
              Navigator.pop(context);
            },
            buttonText: 'RE-CALCULAR',
          )
        ],
      ),
    );
  }
}
