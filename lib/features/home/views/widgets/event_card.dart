import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../models/event.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Theme.of(context).colorScheme.surfaceVariant,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              child: Image.asset(
                event.imagePath,
                fit: BoxFit.cover,
                height: 300.0,
                width: 300.0,
              ),
            ),
            SizedBox(
              width: 300.0,
              child: Text(
                event.location,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 10.0,
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ),
            const Gap(2.0),
            SizedBox(
              width: 300.0,
              child: Text(
                event.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontSize: 12.0,
                    ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 20.0,
          right: 20.0,
          child: Container(
              width: 50,
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.d().format(event.date),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    Text(
                      DateFormat.MMM().format(event.date),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    );
  }
}
