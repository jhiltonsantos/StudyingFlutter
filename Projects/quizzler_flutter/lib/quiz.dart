import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizzlerflutter/quiz_question.dart';

QuizQuestion quizQuestion = QuizQuestion();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];

  _onAlertButtonsPressed(context) {
    Alert(
      context: context,
      type: AlertType.success,
      title: "TESTE FINALIZADO",
      desc: "Você chegou a última questão!!! Parabéns!!!.",
      buttons: [
        DialogButton(
          child: Text(
            "TENTAR NOVAMENTE",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          gradient:
              LinearGradient(colors: [Colors.greenAccent, Colors.blueAccent]),
        ),
        DialogButton(
          child: Text(
            "FECHAR APP",
            style: TextStyle(color: Colors.white, fontSize: 16),
            textAlign: TextAlign.center,
          ),
          onPressed: () => SystemNavigator.pop(),
          gradient:
              LinearGradient(colors: [Colors.orangeAccent, Colors.redAccent]),
        )
      ],
    ).show();
  }

  int correctAnswer() {
    bool answer1 = quizQuestion.getListAnswers()[0];
    bool answer2 = quizQuestion.getListAnswers()[1];
    int numberCorrectQuestion;

    if (answer1) {
      numberCorrectQuestion = 1;
    } else if (answer2) {
      numberCorrectQuestion = 2;
    } else {
      numberCorrectQuestion = 3;
    }

    return numberCorrectQuestion;
  }

  void checkAnswer(int userPicked) {
    int correct = correctAnswer();

    setState(() {
      if (userPicked == correct) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }

      if (quizQuestion.isFinished()) {
        _onAlertButtonsPressed(context);
        scoreKeeper.removeRange(0, scoreKeeper.length);
        quizQuestion.reset();
      } else {
        quizQuestion.nextQuestion();
      }
    });
  }

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
                quizQuestion.getQuestionText(),
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
                quizQuestion.getQuestionA1(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                checkAnswer(1);
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
                quizQuestion.getQuestionA2(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                checkAnswer(2);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.blueAccent,
              child: Text(
                quizQuestion.getQuestionA3(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                checkAnswer(3);
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        SizedBox(
          height: 20.0,
        )
      ],
    );
  }
}
