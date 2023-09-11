import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartBackground extends StatelessWidget {
  const StartBackground(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // Opacity(
          //   opacity: 0.6,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.oswald(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              backgroundColor: const Color.fromARGB(128, 51, 39, 232),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(10)
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text('Start Quiz',style: GoogleFonts.oswald(fontSize: 20,color: Colors.white),),
          )
        ],
      ),
    );
  }
}
