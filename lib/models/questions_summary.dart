import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;
  Color isCorrect(data, int i) {
    if (data['correct_answer'] == data['user_answer']) {
      return Colors.white;
    }
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: summarydata.map((data) {
        return Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 5, 10, 5),
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isCorrect(data, (data['question_index'] as int) + 1),
                ),
                child: Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data['question'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['user_answer'] as String,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    data['correct_answer'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }).toList(),
    );
  }
}
