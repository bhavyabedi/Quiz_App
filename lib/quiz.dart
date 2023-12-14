import 'package:flutter/material.dart';
import 'package:section_2/questions_screen.dart';
import 'package:section_2/start_screen.dart';
import 'package:section_2/data/questions.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswer = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);
    if (selectedAnswer.length == questions.length - 1) {
      setState(() {
        activeScreen = 'start-screen';
        selectedAnswer = [];
      });
    }
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    // else if(activeScreen== 'result-screen'){
    //   screenWidget=
    // }

    return MaterialApp(
      //Same to Main(start screen cause in Quiz screen also, bg is supposed to be same)
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 41, 0, 98),
                Color.fromARGB(255, 132, 48, 250),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
