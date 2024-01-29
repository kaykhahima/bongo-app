import 'package:bongo_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../shared/widgets/button.dart';
import '../widgets/venue_times.dart';

class MovieBooking extends StatefulWidget {
  const MovieBooking({super.key, required this.movie});

  final Movie movie;

  @override
  State<MovieBooking> createState() => _MovieBookingState();
}

class _MovieBookingState extends State<MovieBooking> {
  List<bool> _isDateSelected = [];
  Color _appBarColor = Colors.transparent;
  List<Color> colors = [];

  @override
  void initState() {
    super.initState();
    _isDateSelected = List<bool>.filled(widget.movie.datesAiring.length, false);
    _updateColor();
  }

  _updateColor() async {
    final PaletteGenerator paletteGenerator =
        await PaletteGenerator.fromImageProvider(
      AssetImage(widget.movie.posterPath),
    );

    setState(() {
      colors = paletteGenerator.colors.toList();
      _appBarColor = colors[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            //get color from movie poster
            backgroundColor: _appBarColor,
            expandedHeight: MediaQuery.of(context).size.height * 0.4,
            title: Text(widget.movie.title),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.movie.posterPath,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(right: 16.0, top: 32.0, bottom: 16.0),
              child: SizedBox(
                height: 70.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.movie.datesAiring.length,
                  itemBuilder: (BuildContext context, int index) {
                    final date = widget.movie.datesAiring[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            for (int i = 0; i < _isDateSelected.length; i++) {
                              if (i != index) {
                                _isDateSelected[i] = false;
                              }
                            }

                            _isDateSelected[index] = !_isDateSelected[index];
                          });
                        },
                        child: Container(
                            width: 70.0,
                            height: 70.0,
                            decoration: BoxDecoration(
                              color: _isDateSelected[index]
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.surface,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: _isDateSelected[index]
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat.d().format(date),
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Text(
                                    DateFormat.MMM().format(date),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                final venue = widget.movie.venues[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.outline),
                  ),
                  margin: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Text(venue.location),
                        subtitle: Text(
                          venue.movieType,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                              ),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                        child: VenueTimes(
                          timesShowing: venue.timesShowing,
                        ),
                      ),
                      const Gap(16.0),
                    ],
                  ),
                );
              },
              childCount: widget.movie.venues.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 48.0),
                  child: PrimaryButton(
                    onPressed: () => context.push('/movies/seat-selection',
                        extra: widget.movie),
                    label: 'Book',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
