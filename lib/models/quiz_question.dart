class QuizQuestion {
  QuizQuestion(this.question, this.answers, this.selectedNumber);

  String question;
  List<String> answers;
  int selectedNumber;

  String getQuestion() {
    return question;
  }

  List<String> getAnswer () {
    return answers;
  }
}