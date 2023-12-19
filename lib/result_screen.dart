import 'package:flutter/material.dart';
import 'package:section_2/data/questions.dart';
import 'package:section_2/models/questions_summary.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.selectedAnswer});

  final List<String> selectedAnswer;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < widget.selectedAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answer[0],
        'user_answer': widget.selectedAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You answered X out of Y Answers Correctly!',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(
              summarydata: getSummaryData(),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
