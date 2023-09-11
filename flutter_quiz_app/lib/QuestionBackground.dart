import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/answer_button.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBackground extends StatefulWidget {
  const QuestionBackground(this.onSelectedAnswer, {super.key});

  final void Function(String answer) onSelectedAnswer;

  @override
  State<QuestionBackground> createState() {
    return _QuestionBackgroundState();
  }
}

class _QuestionBackgroundState extends State<QuestionBackground> {
  var currentQuestionIndex = 0;

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.oswald(
                  color: const Color.fromARGB(200, 21, 241, 241),
                  fontSize: 24,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQuestion
                .getShuffledAnswers()
                .map((answer) =>
                AnswerButton(() {
                  widget.onSelectedAnswer(answer);
                  setState(() {
                    currentQuestionIndex++;
                  });
                }, answer))
          ],
        ),
      ),
    );
  }
}
