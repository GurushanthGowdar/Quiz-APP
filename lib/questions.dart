import 'package:flutter/material.dart';

class Quiz_questions extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var questionText;
  int listIndex;
  // final VoidCallback questionHandler;
  Quiz_questions(this.questionText, this.listIndex);

  Widget build(BuildContext context) {
    // print(questionText);
    int helper = listIndex + 1;
    return Container(
      width: double.infinity,
      height: 200.0,
      margin: EdgeInsets.all(40),
      child: Text(
        '\t\t\t\t\t\t\t\t\t    question $helper :\n$questionText',
        style: const TextStyle(fontSize: 25, color: Colors.black),
        textAlign: TextAlign.start,
      ),
    );
  }
}
