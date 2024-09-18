class Questions2 {
  final String questionText;
  final List<Answer2> answerList;

  Questions2(this.questionText, this.answerList);
}

class Answer2 {
  final String answerText;
  final bool isCorrect;

  Answer2(this.answerText, this.isCorrect);
}

List<Questions2> getQuestions2() {
  List<Questions2> list = [];
  list.add(
    Questions2(
      "Which is the feature of python?",
      [
        Answer2("Extensible", false),
        Answer2("Robust", false),
        Answer2("Object-Oriented", false),
        Answer2("All of above", true)
      ],
    ),
  );
  list.add(
    Questions2(
      "Which one is correct?",
      [
        Answer2("Python is a compiled language", false),
        Answer2("Python is a interpreted language", true),
        Answer2("Python is both interpreted and compiled language", false),
      ],
    ),
  );

  return list;
}
