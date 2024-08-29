import 'package:flash_card/answer_button.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class StartQuiz extends StatefulWidget {
  const StartQuiz(this.userQuiz, this.chooseAnswer, {super.key});

  final List<QuizQuestion> userQuiz;
  final void Function(String answer) chooseAnswer;
  @override
  State<StartQuiz> createState() {
    return _StartQuizState();
  }
}

class _StartQuizState extends State<StartQuiz> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswers) {
    widget.chooseAnswer(selectedAnswers);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(contex) {
    List<QuizQuestion> quiz = widget.userQuiz;
    final currentQuestion = quiz[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(25),
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.breeSerif(
                fontSize: 25,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              AnswerButton(
                  answerText: currentQuestion.getAnswer()[0],
                  onTap: () {
                    answerQuestion(currentQuestion.getAnswer()[0]);
                  }),
              const SizedBox(
                width: 60,
              ),
              AnswerButton(
                  answerText: currentQuestion.getAnswer()[1],
                  onTap: () {
                    answerQuestion(currentQuestion.getAnswer()[1]);
                  }),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Row(
            children: [
              AnswerButton(
                  answerText: currentQuestion.getAnswer()[2],
                  onTap: () {
                    answerQuestion(currentQuestion.getAnswer()[2]);
                  }),
              const SizedBox(
                width: 60,
              ),
              AnswerButton(
                  answerText: currentQuestion.getAnswer()[3],
                  onTap: () {
                    answerQuestion(currentQuestion.getAnswer()[3]);
                  }),
            ],
          ),
        ],
      )),
    );
  }
}
