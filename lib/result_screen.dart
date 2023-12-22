import 'package:flutter/material.dart';
import 'package:section_2/data/questions.dart';
import 'package:section_2/models/questions_summary.dart';
import 'package:section_2/quiz.dart';

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
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions Answers Correctly!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 250,
              child: SingleChildScrollView(
                child: QuestionsSummary(
                  summarydata: summaryData,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt_outlined),
              onPressed: () {
                Navigator.push(
                    context, //TO ROUTE THE RETAKE QUIZ BUTTON TO QUIZ SCREEN WHICH GIVES OPTION TO RETAKE QUIZ
                    MaterialPageRoute(builder: (context) => const Quiz()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                foregroundColor: Colors.white,
              ),
              label: const Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
