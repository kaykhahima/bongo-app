import 'package:bongo_app/features/home/models/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({super.key, required this.activity});

  final MainActivity activity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context, activity),
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.surface,
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
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }

  _onTap(BuildContext context, MainActivity activity) {
    switch (activity.title) {
      case 'Movies':
        context.push('/movies');
        break;
      case 'Food':
        context.push('/food');
        break;
      case 'Parties':
        context.push('/parties');
        break;
      case 'Events':
        context.push('/events');
        break;
    }
  }
}
