import 'package:flash_card/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.rightAnswers,
    required this.onRestart,
    required this.createNewQuiz,
    });

  final List<String> chosenAnswer;
  final List<QuizQuestion> rightAnswers;
  final void Function () onRestart;
  final void Function () createNewQuiz;

  int userScore() {
    int c = 0;
    for (int i = 0;i<chosenAnswer.length;i++) {
        if (chosenAnswer[i] == rightAnswers[i].answers[rightAnswers[i].selectedNumber - 1]) {
          c++;
        }
    }
    return c * 100 ~/ chosenAnswer.length;
  }

  int numberOfRightAnswers() {
    int c = 0;
    for (int i = 0;i<chosenAnswer.length;i++) {
        if (chosenAnswer[i] == rightAnswers[i].answers[rightAnswers[i].selectedNumber - 1]) {
          c++;
        }
    }
    return c;
  }

  @override
  Widget build(context) {
    List<String> cA = chosenAnswer;
    return
      Center(
        child: Column(
          children: [
            const SizedBox(height: 350,),
            Text(
              'Your Result!',
              style: GoogleFonts.abel(
                fontSize: 80,
                fontWeight: FontWeight.w900,
                color: Colors.orange
              ),
            ),
            Text(
              'You Scored: ${userScore().toString()}',
              style: GoogleFonts.lato(
                fontSize: 40,
              ),
              ),
            Text(
              '${numberOfRightAnswers().toString()} Right from ${cA.length}'
            ),
            const SizedBox(height: 35,),

            Row(
              children: [
                const SizedBox(width: 28,),

                OutlinedButton(
                  onPressed: onRestart,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 35
                    )
                  ),
                  child: const Text(
                    'Restart Quiz',
                    style: TextStyle(
                      color: Colors.orange
                    ),
                    ),
                  ),

                  const SizedBox(width: 60,),

                  OutlinedButton(
                      onPressed: createNewQuiz,
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.black
                      ),
                      child: const Text(
                          'Create new Quiz',
                          style: TextStyle(
                              color: Colors.orange
                            ),
                          ),
                    ),
              ],
            ),
              
          ],
        ),
      );
  }
}