import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    const width = 150.0;
    const height = 150.0;

    return GestureDetector(
      onTap: () {
        context.push('/movies/movie-booking', extra: movie);
      },
      child: Column(
        children: [
          Card(
            color: Theme.of(context).colorScheme.surfaceVariant,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide.none,
            ),
            child: Image.asset(
              movie.posterPath,
              fit: BoxFit.cover,
              height: height,
              width: width,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(
            width: width,
            child: Text(
              movie.genres.map((g) => g).join(', '),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 12.0,
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ),
          SizedBox(
            width: width,
            child: Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
