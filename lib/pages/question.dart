import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String question;

  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: Text(
          question,
          style: TextStyle(fontSize: 25),
          textAlign: TextAlign.center,
        )
    );
  }
}
