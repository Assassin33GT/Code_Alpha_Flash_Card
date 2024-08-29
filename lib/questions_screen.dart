import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flash_card/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.addQuiz, {super.key});

  final void Function (QuizQuestion userAnswer, int j) addQuiz;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int i = 0;
  String labelT = 'Enter the question';
  String questionT = '';
  List <String> answersT = [];
  QuizQuestion userAnswer = QuizQuestion('', [], 0);
  int uAN = 0;

  void showData(String q,List<String> a, int selectedNumber) {
      setState(() {
        questionT = q;
        if(i < 5){
          labelT = 'Enter The $i Answer';
        }
        if(i == 5){
          labelT = 'Enter the number of the right answer';
        }
        if (i > 2){
          answersT[0] = a[0];
        }
        if (i > 3){
          answersT[1] = a[1];
        }
        if(i > 4){
          answersT[2] = a[2];
        }
        if(i > 5){
          answersT[3] = a[3];
        }
          uAN = selectedNumber;
      });
  }

  void addNewQuestion(){
    if (i < 6) {
      showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text(
                    'Please add question, 4 answers and number of right answer first !',
                    ),
                );
              },
            );
    }
    labelT = 'Enter the question';
  }

  TextInputType typeOfText() {
      if(i == 5){
        return TextInputType.number;
      }
      else{
        return TextInputType.text;
      }
  }

  List<TextInputFormatter> typeOfFormate() {
    if (i == 5)
      {return [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.allow(RegExp(r'[1-4]')),
      ];}
    else{
      return [];
    }
  }

  @override
  Widget build(context) {
    String labelText = labelT;
    final TextEditingController controller = TextEditingController();
    String enteredQuestion = questionT;
    List<String> enteredAnswers = answersT;
    int selectedNumber = uAN;

    void addQuestion(QuizQuestion userAnswer1, int j){
      widget.addQuiz(userAnswer1, j);
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 50,),
          Text(
            'Create Your Quiz',
            style: GoogleFonts.lato(
              fontSize: 30,
              color: Colors.orange,
              fontWeight: FontWeight.bold,
            ),
            ),
          const SizedBox(height: 30,),
          Container(
            width: 400,
            child: TextField(
              controller: controller,
              keyboardType: typeOfText(),
              inputFormatters: typeOfFormate(),
              decoration: InputDecoration(
                filled: true,
                fillColor:const Color.fromARGB(255, 240, 240, 240),
                labelText: labelText,
                labelStyle: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          
          ElevatedButton(
            onPressed: () {
              if (i > 5) {
              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text(
                      'No more answers can be added',
                      ),
                  );
                },
              );}
              if (i == 0){
                enteredQuestion = controller.text;
              }
              else if (i > 0 && i <= 4){
                enteredAnswers.add(controller.text);
              }else {
                setState(() {
                  if(int.parse(controller.text) > 0 && int.parse(controller.text) < 5)
                  {selectedNumber = int.parse(controller.text);}
                });
               
              }
              if (i == 5) {
                addQuestion(QuizQuestion(enteredQuestion, enteredAnswers, selectedNumber), 0);
              }
              if (i < 6){
                i++;
              }
              showData(enteredQuestion,enteredAnswers,selectedNumber);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black
            ),
            child: const Text(
              'Submit',
              style: TextStyle(
                        color: Colors.orange
                      ),
              ),
            
          ),
          const SizedBox(height: 20,),
      
            if (i >= 1)
              Text(
                enteredQuestion,
                 style: GoogleFonts.breeSerif(
                  fontSize: 25,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20,),
          Row(
            children: [
              const SizedBox(width: 30,),
      
              if (i > 1)
                Container(
                  width: 150,
                  height: 200,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 241, 170, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                    ),
                    child: Text(
                      enteredAnswers[0],
                      textAlign: TextAlign.center,),
                    ),
                ),
      
              const SizedBox(width: 60,),
      
              if (i > 2)
                Container(
                  width: 150,
                  height: 200,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 241, 170, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                    ),
                    child: Text(
                      enteredAnswers[1],
                      textAlign: TextAlign.center,
                      ),
                    ),
                ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 30,),
              if (i > 3)
                Container(
                  width: 150,
                  height: 200,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 241, 170, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                    ),
                    child: Text(
                      enteredAnswers[2],
                      textAlign: TextAlign.center,
                    ),
                    ),
                ),
      
                const SizedBox(width: 60,),
              if (i > 4)
                Container(
                  width: 150,
                  height: 200,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                    backgroundColor:const Color.fromARGB(255, 241, 170, 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)
                    ),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2
                    )
                    ),
                    child: Text(
                      enteredAnswers[3],
                      textAlign: TextAlign.center,
                      ),
                    ),
                ),
            ],
          ),
          const SizedBox(height: 10,),
          if (i > 5)
            Text(
              'The right answer: ${enteredAnswers[selectedNumber - 1]}',
              style: const TextStyle(
                backgroundColor: Colors.orange
              ),
              textAlign: TextAlign.center,
            ),
          
              ElevatedButton(
                onPressed: () {
                  addNewQuestion();
                  if (i > 5){
                    setState(() {
                    enteredAnswers = [];
                    enteredQuestion = '';
                    answersT = [];
                    selectedNumber = 0;
                    i = 0;
                  });}
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  'Add new question',
                  style: TextStyle(
                        color: Colors.orange
                      ),
                  ), 
              ),
              const SizedBox(width: 60,),
              ElevatedButton(
                onPressed: () {
                  if (i < 6)
                  {
                    showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text(
                      'Please add question, 4 answers and number of right answer first !',
                      ),
                  );
                },
              );
                  }else{
                  addQuestion(userAnswer, 1);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(
                    color: Colors.orange
                  ),
                ), 
              ),
            const SizedBox(height: 500,)
          
        ],
      ),
    );
  }
}