import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int questionNumber = 0;
  List<String> questions = [
    'Dentre as alternativas a seguir, qual não faz parte de um item de hardware?',
    'Selecione a opção abaixo que não caracteriza uma medida de segurança para seu computador.',
    'SQL ou Linguagem de Consulta Estruturada é a linguagem padrão para consultas e alterações de dados em bancos de dados relacionais. No laboratório de qual empresa famosa de informática foi desenvolvida essa linguagem?',
  ];
  List<List> answers = [
    ['Mouse', 'Processador', 'Debian'],
    [
      'Deixar o Firewall ativado',
      'Mascarar seu endereçamento IP utilizando o proxy',
      'Utilizar o desfragmentador de discos do windows'
    ],
    ['IBM', 'Microsoft', 'Oracle']
  ];

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
                answers[questionNumber][0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
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
                answers[questionNumber][1],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
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
                answers[questionNumber][2],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () {
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
