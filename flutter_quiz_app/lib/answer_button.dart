import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.onTap, this.answerText, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
        margin: const EdgeInsets.only(top : 5),
        height: 50,
        child: ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                backgroundColor: const Color.fromARGB(255, 48, 2, 89),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
            child: Text(
              answerText,
              textAlign: TextAlign.center,
            )));
  }
}
