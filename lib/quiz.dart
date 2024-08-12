
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/question.dart';
import 'package:quizapp/result.dart';

import 'home.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  Widget? activeScreen ;

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length){
      setState(() {
        
        activeScreen = Result(selectedAnswers,restart);
       
      });

    }
    log(selectedAnswers.toString());
  }

  void restart(){
     setState(() {
       selectedAnswers = [];
       activeScreen = Home(switchScreen); 
     });
  }

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen); 
  }

  void switchScreen(){
    setState(() {
      activeScreen =  Question(chooseAnswer);
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 88, 67, 248),
              Color.fromARGB(255, 6, 62, 204),
            ])
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}