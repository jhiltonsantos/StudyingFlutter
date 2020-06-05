import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 80.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 35.0,
);

const kButtonTextStyle = TextStyle(
  color: Colors.amberAccent,
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 80.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black12,
  icon: Icon(
    Icons.map,
    color: Colors.amberAccent,
  ),
  hintText: 'Nome da Cidade...',
  hintStyle: TextStyle(color: Colors.amberAccent),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(20.0)),
    borderSide: BorderSide.none,
  ),
);

const apiKey = 'b05124d95faebf72fd97a662c3f297d6';
const openWeatherMap = 'https://api.openweathermap.org/data/2.5/weather';
