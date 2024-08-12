import 'package:flutter/material.dart';
import 'package:quizapp/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'data/questions.dart';

class Question extends StatefulWidget {
  const Question(this.onSelectedAnswer, {super.key});

  final void Function(String) onSelectedAnswer;

  @override
  State<Question> createState() => _QuestionsState();
}

class _QuestionsState extends State<Question> {
  var currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectedAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion.text,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          const SizedBox(
            height: 10,
          ),
          ...currentQuestion.ShuffledAnswers.map(
            (e) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: AnswerButton(
                  AnswerText: e,
                  onPressed: () {
                    answerQuestion(e);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
