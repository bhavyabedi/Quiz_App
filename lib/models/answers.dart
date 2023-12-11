import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  const Answers({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          horizontal: 70,
          vertical: 12,
        ),
        shape: const LinearBorder(),
        backgroundColor: const Color.fromARGB(255, 54, 0, 102),
        foregroundColor: Colors.white,
      ),
      onPressed: onTap,
      child: Text(
        text,
      ),
    );
  }
}
