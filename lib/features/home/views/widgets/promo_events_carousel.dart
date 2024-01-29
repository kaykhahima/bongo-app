import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/the_everything_provider.dart';
import 'event_promo_card.dart';

class EventsPromoCarousel extends StatelessWidget {
  const EventsPromoCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EverythingProvider>(context, listen: false);

    return ExpandableCarousel(
      options: CarouselOptions(
        height: 300.0,
        viewportFraction: 1.0,
        showIndicator: true,
        autoPlay: true,
        slideIndicator: CircularStaticIndicator(
          indicatorRadius: 3.0,
          itemSpacing: 10.0,
          currentIndicatorColor: Theme.of(context).colorScheme.primary,
          indicatorBackgroundColor: Theme.of(context).colorScheme.outline,
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
        ),
      ),
      items: provider.events.map((event) {
        return Builder(
          builder: (BuildContext context) {
            return EventPromoCard(event: event);
          },
        );
      }).toList(),
    );
  }
}
