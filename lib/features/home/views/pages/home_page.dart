import 'package:bongo_app/features/home/provider/home_provider.dart';
import 'package:bongo_app/features/home/views/widgets/movie_card.dart';
import 'package:bongo_app/features/home/views/widgets/section_header.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../widgets/activities_tile.dart';
import '../widgets/event_card.dart';
import '../widgets/event_promo_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          ListView(
            children: [
              ExpandableCarousel(
                options: CarouselOptions(
                  height: 250.0,
                  viewportFraction: 1.0,
                  showIndicator: true,
                  autoPlay: true,
                  slideIndicator: CircularStaticIndicator(
                    indicatorRadius: 3.0,
                    itemSpacing: 10.0,
                    currentIndicatorColor:
                        Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 10.0),
                  ),
                ),
                items: homeProvider.events.map((event) {
                  return Builder(
                    builder: (BuildContext context) {
                      return EventPromoCard(event: event);
                    },
                  );
                }).toList(),
              ),
              const Gap(16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: homeProvider.mainActivities
                      .map((activity) => ActivityTile(activity: activity))
                      .toList(),
                ),
              ),
              const Gap(16.0),
              SectionHeader(
                title: 'Now Showing',
                subtitle: 'Cinema',
                onTap: () {},
              ),
              SizedBox(
                height: 165.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  itemCount: homeProvider.movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = homeProvider.movies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: MovieCard(movie: movie),
                    );
                  },
                ),
              ),
              const Gap(10.0),
              SectionHeader(
                title: 'Others',
                subtitle: 'Food, Events and More',
                onTap: () {},
              ),
              SizedBox(
                height: 350.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  itemCount: homeProvider.events.length,
                  itemBuilder: (BuildContext context, int index) {
                    final event = homeProvider.events[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: EventCard(event: event),
                    );
                  },
                ),
              ),
            ],
          ),
          // Positioned(
          //   top: 20.0,
          //   left: 0.0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       SizedBox(
          //         height: 40.0,
          //         width: 300.0,
          //         child: TextField(
          //           decoration: InputDecoration(
          //             hintText: 'Search',
          //             hintStyle: Theme.of(context).textTheme.bodySmall,
          //             prefixIcon: const Icon(
          //               Icons.search,
          //               color: Colors.white,
          //               size: 20,
          //             ),
          //             filled: true,
          //             fillColor: Colors.white.withOpacity(0.7),
          //             border: OutlineInputBorder(
          //               borderRadius: BorderRadius.circular(8.0),
          //               borderSide: BorderSide.none,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
