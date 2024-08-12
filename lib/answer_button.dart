import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    {
    super.key, required this.AnswerText, required this.onPressed,
  });

  final String AnswerText;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple[900],
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
    ),
     child: Text(AnswerText,style:const TextStyle(fontSize: 18),textAlign: TextAlign.center,));
  }
}
