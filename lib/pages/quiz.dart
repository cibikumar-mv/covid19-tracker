import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerButton;
  final int qindex;

  Quiz(
      {@required this.questions,
      @required this.qindex,
      @required this.answerButton});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: new Image.asset(questions[qindex]["image"], height: 250),
        ),
        Question(questions[qindex]["question"]),
        ...(questions[qindex]["answer"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            () => answerButton(answer["score"]),
            answer["text"],
          );
        }).toList()
      ],
    );
  }
}
