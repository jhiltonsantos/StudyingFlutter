class Question {
  String questionText;
  String questionAnswer1;
  String questionAnswer2;
  String questionAnswer3;
  List alternatives;

  Question({String q, String a1, String a2, String a3, List r}) {
    questionText = q;
    questionAnswer1 = a1;
    questionAnswer2 = a2;
    questionAnswer3 = a3;
    alternatives = r;
  }
}

class QuizQuestion {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
        q: 'Dentre as alternativas a seguir, qual não faz parte de um item de hardware?',
        a1: 'Mouse',
        a2: 'Processador',
        a3: 'Debian',
        r: [false, false, true]),
    Question(
        q: 'Selecione a opção abaixo que não caracteriza uma medida de segurança para seu computador.',
        a1: 'Deixar o Firewall ativado',
        a2: 'Utilizar o desfragmentador de discos do windows',
        a3: 'Mascarar seu endereçamento IP utilizando o proxy',
        r: [false, true, false]),
    Question(
        q: 'SQL ou Linguagem de Consulta Estruturada é a linguagem padrão para consultas e alterações de dados em bancos de dados relacionais. No laboratório de qual empresa famosa de informática foi desenvolvida essa linguagem?',
        a1: 'IBM',
        a2: 'Microsoft',
        a3: 'Oracle',
        r: [true, false, false])
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getQuestionA1() {
    return _questionBank[_questionNumber].questionAnswer1;
  }

  String getQuestionA2() {
    return _questionBank[_questionNumber].questionAnswer2;
  }

  String getQuestionA3() {
    return _questionBank[_questionNumber].questionAnswer3;
  }

  List getListAnswers() {
    return _questionBank[_questionNumber].alternatives;
  }
}
