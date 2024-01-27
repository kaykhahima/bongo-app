import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton(
      {super.key, required this.onPressed, required this.label});

  final VoidCallback onPressed;
  final String label;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(25.0),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: Text(
        widget.label,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
