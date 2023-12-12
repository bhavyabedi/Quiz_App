import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 187, 143, 248),
        foregroundColor: Colors.white,
      ),
      onPressed: onTap,
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
