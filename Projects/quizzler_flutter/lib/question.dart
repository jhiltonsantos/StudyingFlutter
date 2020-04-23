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
