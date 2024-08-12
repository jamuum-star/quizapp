import 'package:flutter/material.dart';
import 'package:quizapp/home.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
          child: const Home(),
        ),
      ),
    );
  }
}