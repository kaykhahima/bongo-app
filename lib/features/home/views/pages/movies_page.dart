import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/input_field.dart';
import '../../provider/the_everything_provider.dart';
import '../widgets/large_movie_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final _searchController = TextEditingController();

  late EverythingProvider _provider;
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _provider = Provider.of<EverythingProvider>(context, listen: false);
    _isSelected = List<bool>.filled(_provider.uniqueMovieGenres.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(32.0),
              InputField(
                controller: _searchController,
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.outline,
                ),
                hintText: 'Tafuta movie',
                textCapitalization: TextCapitalization.sentences,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Andika jina la movie';
                  }
                  return null;
                },
              ),
              const Gap(12.0),
              SizedBox(
                height: 40.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: _provider.uniqueMovieGenres.length,
                  itemBuilder: (BuildContext context, int index) {
                    final genre = _provider.uniqueMovieGenres[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: FilterChip(
                        label: Text(genre),
                        selected: _isSelected[index],
                        onSelected: (bool value) {
                          setState(() {
                            _isSelected[index] = value;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const Gap(12.0),
              Text(
                'Now Showing',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Gap(8.0),
              SizedBox(
                height: 370.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _provider.nowShowingMovies.length,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = _provider.nowShowingMovies[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 4.0),
                      child: LargeMovieCard(movie: movie),
                    );
                  },
                ),
              ),
              const Gap(12.0),
              Text(
                'Trending',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: 600,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 0.6,
                  children:
                      List.generate(_provider.trendingMovies.length, (index) {
                    final movie = _provider.trendingMovies[index];
                    return GestureDetector(
                      onTap: () =>
                          context.push('/movies/movie-booking', extra: movie),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Card(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceVariant,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide.none,
                                ),
                                child: Image.asset(
                                  movie.posterPath,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: double.infinity,
                                ),
                              ),
                            ),
                            SizedBox(
                              // width: width,
                              child: Text(
                                movie.genres.map((g) => g).join(', '),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontSize: 12.0,
                                      color:
                                          Theme.of(context).colorScheme.outline,
                                    ),
                              ),
                            ),
                            SizedBox(
                              // width: width,
                              child: Text(
                                movie.title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // SizedBox(
              //   height: 350.0,
              //   child: ListView.builder(
              //     scrollDirection: Axis.horizontal,
              //     itemCount: _provider.trendingMovies.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       final movie = _provider.trendingMovies[index];
              //       return Padding(
              //         padding: const EdgeInsets.only(right: 4.0),
              //         child: LargeMovieCard(movie: movie),
              //       );
              //     },
              //   ),
              // ),
              const Gap(56.0),
            ],
          ),
        ),
      ),
    );
  }
}
