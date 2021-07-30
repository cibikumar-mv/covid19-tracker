import 'package:covid19/pages/quiz.dart';
import 'package:covid19/pages/quizresult.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  var _qindex = 0;

  var _questions = [
    {
      "image" : "assets/images/fever.png",
      "question": "Do you suffer from fever?",
      "answer" : [
        {"text":"Yes","score":1},
        {"text":"No","score":0},
      ]
    },
    {
      "image" : "assets/images/dry_cough.png",
      "question": "Do you have Dry Cough?",
      "answer" : [
        {"text":"Yes","score":1},
        {"text":"No","score":0},
      ]
    },
    {
      "image" : "assets/images/headache.png",
      "question": "Does headache occurs often?",
      "answer" : [
        {"text":"Yes","score":1},
        {"text":"No","score":0},
      ]
    },
    {
      "image" : "assets/images/chest_pain.png",
      "question": "Do you have chest pain?",
      "answer" : [
        {"text":"Yes","score":3},
        {"text":"No","score":0},
      ]
    },
    {
      "image" : "assets/images/speech.png",
      "question": "Do you suffer from loss of speech or movement?",
      "answer" : [
        {"text":"Yes","score":1},
        {"text":"No","score":0},
      ]
    },
    {
      "image" : "assets/images/breathing_difficulty.png",
      "question": "Do you have difficulty in breathing?",
      "answer" : [
        {"text":"Yes","score":3},
        {"text":"No","score":0},
      ]
    },
  ];
  int _totalscore=0;

  void _reset(){
    setState(() {
      _totalscore = 0;
      _qindex = 0;
    });

  }
  void _answerButton(int score){
    _totalscore += score;
    setState(() {
      _qindex = _qindex+1;
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[200],
        body: (_qindex < _questions.length)?
        Quiz(questions: _questions , qindex: _qindex, answerButton: _answerButton)
            :Result(_totalscore,_reset),
      ),
    );
  }
}
