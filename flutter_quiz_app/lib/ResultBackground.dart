import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/QuestionSummary.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultBackground extends StatelessWidget {
  const ResultBackground(this.restartQuiz, this.chosenAnswers, {super.key});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> result = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      result.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return result;
  }

  @override
  Widget build(context) {
    final summaryData = getSummary();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctQuestions out of $totalQuestions questions correctly!',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            FilledButton.icon(
                icon: const Icon(Icons.refresh_sharp),
                onPressed: restartQuiz,
                label: Text('Restart Quiz !',
                    style:
                        GoogleFonts.oswald(fontSize: 20, color: Colors.white)))
          ],
        ),
      ),
    );
  }
}
