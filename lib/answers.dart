import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  VoidCallback clickHandler;
  var optionText;

  Answers({this.optionText, required this.clickHandler});

  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: ElevatedButton(
        onPressed: clickHandler,
        child: Text(
          optionText,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
