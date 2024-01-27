import 'package:bongo_app/features/home/models/main_activity.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../../../shared/widgets/rounded_button.dart';
import '../../models/event.dart';

class EventPromoCard extends StatelessWidget {
  const EventPromoCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            event.imagePath,
            height: 250.0,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
        ),
        Positioned(
          child: Container(
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.surface.withOpacity(0.0),
                    Theme.of(context).colorScheme.surface.withOpacity(0.9),
                    Theme.of(context).colorScheme.surface,
                  ],
                  stops: const [
                    0.0,
                    0.7,
                    1.0,
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        event.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const Gap(5.0),
                      Text(DateFormat.jm().format(event.date)),
                    ],
                  ),
                  const Gap(2.0),
                  Text(
                    event.location,
                  ),
                  SizedBox(
                    width: 75.0,
                    child: RoundedButton(onPressed: () {}, label: 'Book'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
