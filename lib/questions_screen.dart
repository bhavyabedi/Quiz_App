import 'package:flutter/material.dart';
import 'package:section_2/models/answers.dart';
import 'package:section_2/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsState();
  }
}

class _QuestionsState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final currentQuestion = questions[0];
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Answers(text: currentQuestion.answer[0], onTap: () {}),
          Answers(text: currentQuestion.answer[1], onTap: () {}),
          Answers(text: currentQuestion.answer[2], onTap: () {}),
        ],
      ),
    );
  }
}
