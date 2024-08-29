import 'package:flash_card/questions_screen.dart';
import 'package:flash_card/result_screen.dart';
import 'package:flash_card/start_quiz.dart';
import 'package:flutter/material.dart';
import 'package:flash_card/start_screen.dart';
import 'package:flash_card/models/quiz_question.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<QuizQuestion> userQuiz = [];
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen () {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  List<QuizQuestion> getQuizQuestion() {
    return userQuiz;
  }

  void chooseAnswer(answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == userQuiz.length - 1) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  void addQuiz(QuizQuestion quiz,int i) {
    if (i == 0 || i == 1){
      userQuiz.add(quiz);
    }
    if (i == 1) {
      setState(() {
        activeScreen = 'start-quiz';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'start-quiz';
    });
  }

  void createNewQuiz() {
    setState(() {
      selectedAnswers = [];
      userQuiz = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    
    if (activeScreen == 'start-screen') {
      StartScreen(switchScreen);
    }

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(addQuiz);
    }

    if (activeScreen == 'start-quiz') {
      screenWidget = StartQuiz(userQuiz,chooseAnswer);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswers,
        rightAnswers: userQuiz,
        onRestart: onRestart,
        createNewQuiz: createNewQuiz,
        );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(219, 82, 15, 216),
              Color.fromARGB(225, 68, 11, 238)
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            )
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}