import 'package:bongo_app/features/home/models/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({super.key, required this.activity});

  final MainActivity activity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Theme.of(context).colorScheme.surfaceVariant,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Icon(
              activity.icon,
              color: Theme.of(context).colorScheme.primary,
              size: 40.0,
            ),
          ),
        ),
        const Gap(4.0),
        Text(
          activity.title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 12.0,
              ),
        ),
      ],
    );
  }
}