import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Column(
        children: [
          Container(
            width: 150,
            height: 200,
            child: OutlinedButton(
              onPressed: onTap,
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
                answerText,
                style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  fontSize: 20
                ),
                textAlign: TextAlign.center,
                ),
            ),
          ),
        ],
      );
  }
}
