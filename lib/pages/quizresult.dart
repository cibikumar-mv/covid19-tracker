import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  @override
  final int score;
  Function reset;

  Result(this.score, this.reset);

  String get title{
    if(score == 0)
      return "YOU ARE PERFECTLY FINE!";
    else if(score >= 1 && score <=5)
      return "YOU MIGHT BE FINE";
    else
      return "YOU CHECK MOST OF THE SYMPTOMS";
  }

  String get subtitle{
    if(score == 0)
      return "BUT MAKE SURE TO FOLLOW THE RULES";
    else if(score >= 1 && score <=5)
      return "IT IS ADVISED TO TAKE A TEST TO BE SURE";
    else
      return "IT IS STRONGLY ADVISED TO VISIT A DOCTOR";
  }

  String get image{
    if(score == 0)
      return "assets/images/Healthy.png";
    else if(score >= 1 && score <=5)
      return "assets/images/doctors.png";
    else
      return "assets/images/doctor_heros.png";
  }

  Widget build(BuildContext context) {
      return Scaffold(
        // backgroundColor: Colors.teal,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: new Image.asset(image, height: 300),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
            ),
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: reset,
              child: Text(
                "Restart Quiz?",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            )
          ],
        ),
      );
  }
}
