import 'package:flutter/material.dart';
import 'package:imcalculator/screens/result_page.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(IMCCalculator());

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
        '/result': (context) => ResultPage(),
      },
      debugShowCheckedModeBanner: true,
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C22),
        scaffoldBackgroundColor: Color(0xFF090C22),
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: kActiveIconColor,
            inactiveTrackColor: kInactiveIconColor,
            thumbColor: kBottomContainerColor,
            overlayColor: kOverlayBottomColor,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0)),
      ),
    );
  }
}
