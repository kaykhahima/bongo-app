import 'package:flutter/material.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(55.0),
        ),
      ),
      onPressed: widget.onTap,
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({super.key, required this.onTap, required this.title});

  final VoidCallback onTap;
  final String title;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(55.0),
        ),
      ),
      onPressed: () => widget.onTap,
      child: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class SecondaryButtonWithIcon extends StatefulWidget {
  const SecondaryButtonWithIcon(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon});

  final VoidCallback onTap;
  final String title;
  final Widget icon;

  @override
  State<SecondaryButtonWithIcon> createState() =>
      _SecondaryButtonWithIconState();
}

class _SecondaryButtonWithIconState extends State<SecondaryButtonWithIcon> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all<Size>(
          const Size.fromHeight(55.0),
        ),
      ),
      onPressed: () => widget.onTap,
      icon: widget.icon,
      label: Text(
        widget.title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}
