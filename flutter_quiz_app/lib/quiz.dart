import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/QuestionBackground.dart';
import 'package:flutter_quiz_app/ResultBackground.dart';
import 'package:flutter_quiz_app/StartBackground.dart';
import 'package:flutter_quiz_app/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartBackground(switchScreen);
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultBackground(switchScreen,selectedAnswers);
      });
    }
  }

  void switchScreen() {
    selectedAnswers = [];
    setState(() {
      activeScreen =  QuestionBackground(chooseAnswer);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}