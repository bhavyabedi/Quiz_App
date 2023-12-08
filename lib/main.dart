import 'package:flutter/material.dart';
import 'package:section_2/quiz.dart';

void main() {
  runApp(
    MaterialApp(
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
          child: const Quiz(),
        ),
      ),
    ),
  );
}
