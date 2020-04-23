import 'package:flutter/material.dart';
import 'package:quizzlerflutter/question.dart';
import 'home.dart';

QuizQuestion quizQuestion = QuizQuestion();

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}
