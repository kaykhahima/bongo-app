import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/input_field.dart';
import '../../provider/home_provider.dart';
import '../widgets/large_movie_card.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final _searchController = TextEditingController();

  late HomeProvider _homeProvider;
  List<bool> _isSelected = [];

  @override
  void initState() {
    super.initState();
    _homeProvider = Provider.of<HomeProvider>(context, listen: false);
    _isSelected =
        List<bool>.filled(_homeProvider.uniqueMovieGenres.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
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
                itemCount: _homeProvider.uniqueMovieGenres.length,
                itemBuilder: (BuildContext context, int index) {
                  final genre = _homeProvider.uniqueMovieGenres[index];
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
              height: 350.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _homeProvider.nowShowingMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = _homeProvider.nowShowingMovies[index];
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
            const Gap(8.0),
            SizedBox(
              height: 350.0,
              child: ListView.builder(
                reverse: true,
                scrollDirection: Axis.horizontal,
                itemCount: _homeProvider.trendingMovies.length,
                itemBuilder: (BuildContext context, int index) {
                  final movie = _homeProvider.trendingMovies[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: LargeMovieCard(movie: movie),
                  );
                },
              ),
            ),
            const Gap(24.0),
          ],
        ),
      ),
    );
  }
}
