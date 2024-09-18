class Questions {
  final String questionText;
  final List<Answer> answerList;

  Questions(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}

List<Questions> getQuestions() {
  List<Questions> list = [];
  list.add(
    Questions(
      "What is Programming?",
      [
        Answer("Writing programs so that the computers can understand", false),
        Answer("Instructing the computer to execute some tasks", false),
        Answer("Seqence of steps of instruction to solve a problem", false),
        Answer("All of above", true)
      ],
    ),
  );

  return list;
}
