import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';

import 'summary.dart';

class Result extends StatelessWidget {
  const Result(this.selectedAnswers, this.restart, {super.key});
  final void Function() restart;

  final List<String> selectedAnswers;
  List<Map<String, Object>> get SummaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    int numOfCorrectAnswer = SummaryData.where(
            (element) => element['user_answer'] == element['correct_answer'])
        .length;
    // var numOfCorrectAnswer = 0;
    // for (var i = 0; i < summaryData.length; i++) {
    //   if (summaryData[i]['user_answer'] == summaryData[i]['correct_answer']) {
    //     numOfCorrectAnswer++;
    //   }
    // }
    // summaryData.forEach((element) {
    //   if (element['user_answer'] == element['correct_answer']) {
    //     numOfCorrectAnswer++;
    //   }
    // });

    // for (var element in summaryData) {
    //   if (element['user_answer'] == element['correct_answer']) {
    //     numOfCorrectAnswer++;
    //   }
    // }
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'you answes $numOfCorrectAnswer out of ${questions.length} questions correctly',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          SummaryPage(SummaryData),
          const SizedBox(height: 30),
          TextButton.icon(
            onPressed: restart,
            icon: const Icon(
              Icons.restart_alt_outlined,
              color: Colors.greenAccent,
            ),
            label: const Text(
              'Restert Quiz',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
