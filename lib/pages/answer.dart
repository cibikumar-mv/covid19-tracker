import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final Function functionptr;
  final String ans;

  @override
  Answer(this.functionptr,this.ans);

  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RaisedButton(
          splashColor: Colors.blue[100],
          color: Colors.white,
          child: Text(ans, style: TextStyle(color: Colors.blue)),
          onPressed: functionptr,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(color: Colors.lightBlue, width: 2.0)),
        ),
      ),
    );
  }
}
