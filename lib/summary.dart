import 'package:flutter/material.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage(this.SummaryData, {super.key});
  final List<Map<String, Object>> SummaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...SummaryData.map(
              (e) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: e['user_answer'] == e['correct_answer']
                            ? Colors.green[600]
                            : Colors.red[600],
                        child: Text(
                          ((e['question_index'] as int) + 1).toString(),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e['question'].toString(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              e['correct_answer'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 6, 230, 35),
                                  fontSize: 14),
                            ),
                            Text(
                              e['user_answer'].toString(),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 207, 142, 210),
                                  fontSize: 14),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
