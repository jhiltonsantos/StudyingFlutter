import 'package:flutter/material.dart';
import 'dart:math';

class Calculate {
  Calculate({@required this.height, @required this.weight, @required this.age, @required this.gender});

  final int height;
  final int weight;
  final int age;
  final String gender;


  double _imc;

  String calculateIMC() {
    _imc = (weight / pow(height / 100, 2));
    return _imc.toStringAsFixed(1);
  }

  String getResult() {
    if (_imc < 18.5) {
      return 'Abaixo do peso';
    } else if (_imc >= 18.5 && _imc <= 24.9) {
      return 'Peso Normal';
    } else if (_imc >= 25 && _imc <= 29.9) {
      return 'Sobrepeso';
    } else if (_imc >= 30 && _imc <= 34.9) {
      return 'Obesidade Grau 1';
    } else if (_imc >= 35 && _imc <= 39.9) {
      return 'Obesidade Grau 2';
    } else {
      return 'Obesidade Grau 3';
    }
  }

  String getInterpretation() {
    if (_imc < 18.5) {
      return 'Você pode estar com deficiências de nutrientes ou sob o risco de estar com anorexia.';
    } else if (_imc >= 18.5 && _imc <= 24.9) {
      return 'Você está dentro da faixa normal de peso. Para manter o peso é importante manter uma dieta balanceada para seu organismo.';
    } else if (_imc >= 25 && _imc <= 29.9) {
      return 'Manter hábitos alimentares saudáveis e praticar atividades físicas são bons aliados contra o excesso de peso.';
    } else if (_imc >= 30 && _imc <= 34.9) {
      return 'A obesidade já é considerada uma comorbidade e necessita de tratamento profissional. O indicado é consultar um especialista e receber acompanhamento adequado.';
    } else if (_imc >= 35 && _imc <= 39.9) {
      return 'Você necessita de profissional especializado e receber as orientações e medidas adequadas para obter uma saúde equilibrada.';
    } else {
      return ' O peso neste grau apresenta problemas extremamente graves e necessita de tratamento profissional com o máximo de recursos disponíveis.';
    }
  }
}
