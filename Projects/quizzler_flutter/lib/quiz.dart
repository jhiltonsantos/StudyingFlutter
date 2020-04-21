import 'package:flutter/material.dart';
import 'questionAnswers.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;


  List<Widget> scoreKeeper = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[questionNumber],
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25.0, color: Colors.white),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.teal,
              child: Text(
                alternatives[questionNumber][0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber][0];
                if (correctAnswer) {
                  print('Está correto');
                } else {
                  print('Esta errado');
                }
                questionNumber++;
                if ((questions.length) > questionNumber) {
                  setState(() {});
                } else {
                  questionNumber--;
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.orangeAccent,
              child: Text(
                alternatives[questionNumber][1],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber][1];
                if (correctAnswer) {
                  print('Está correto');
                } else {
                  print('Esta errado');
                }
                questionNumber++;
                if ((questions.length) > questionNumber) {
                  setState(() {});
                } else {
                  questionNumber--;
                }
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blue,
              child: Text(
                alternatives[questionNumber][2],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                bool correctAnswer = answers[questionNumber][2];
                if (correctAnswer) {
                  print('Está correto');
                } else {
                  print('Esta errado');
                }
                questionNumber++;
                if ((questions.length) > questionNumber) {
                  setState(() {});
                } else {
                  questionNumber--;
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
