import 'package:flutter/material.dart';

class SeatRowLetter extends StatelessWidget {
  const SeatRowLetter({super.key, required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.5),
      child: Text(
        letter,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
