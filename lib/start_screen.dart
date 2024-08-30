import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});

  final void Function () startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 180,),
          RichText(
  text: TextSpan(
    children: [
      TextSpan(
        text: 'Quiz',
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 241, 170, 5),
          fontSize: 90,
          fontWeight: FontWeight.w900,
        ),
      ),
      const WidgetSpan(
        child: SizedBox(width: 10,), // Control the space here
      ),
      TextSpan(
        text: 'App',
        style: GoogleFonts.lato(
          color: const Color.fromARGB(255, 241, 170, 5),
          fontSize: 40,
          fontWeight: FontWeight.w900,
        ),
      ),
    ],
  ),
),
          const SizedBox(height: 30,),
          Image.asset(
            'android/assets/images/Gray-cards.png',
          color: const Color.fromARGB(255, 241, 170, 5),
          width: 200,
          ),
          const SizedBox(height: 10,),
          
          const SizedBox(height: 70,),
          OutlinedButton(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 21, 39, 175),
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: const Color.fromARGB(255, 241, 170, 5),
              side: const BorderSide(color: Color.fromARGB(255, 168, 10, 204))
            ),
            child: const Text('Create you Quiz!'),
            ),
            
        ],
      ),
    );
  }
}