import 'package:bongo_app/features/home/provider/home_provider.dart';
import 'package:bongo_app/features/home/views/widgets/movie_card.dart';
import 'package:bongo_app/features/home/views/widgets/section_header.dart';
import 'package:bongo_app/shared/widgets/input_field.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../widgets/activities_tile.dart';
import '../widgets/event_card.dart';
import '../widgets/event_promo_card.dart';
import '../widgets/home_input_field.dart';
import '../widgets/promo_events_carousel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: true,
            forceElevated: true,
            expandedHeight: 250,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(children: [
                EventsPromoCarousel(),
                SizedBox(
                  height: 80,
                  child: HomeSearchField(),
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
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
                  onTap: () => context.push('/movies'),
                ),
                SizedBox(
                  height: 250.0,
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
                    title: 'Events',
                    subtitle: 'Food, Events and More',
                    onTap: () => context.push('/events')),
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
          ),
        ],
      ),
    );
  }
}
