import 'package:flutter/material.dart';
import 'input_page.dart';
import 'constants.dart';

void main() => runApp(IMCCalculator());

class IMCCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)),
      ),
      home: InputPage(),
    );
  }
}
