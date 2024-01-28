import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../models/movie.dart';

class LargeMovieCard extends StatelessWidget {
  const LargeMovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/movies/movie-booking', extra: movie);
      },
      child: Column(
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
              movie.posterPath,
              fit: BoxFit.cover,
              height: 300.0,
              width: 230.0,
            ),
          ),
          SizedBox(
            width: 100.0,
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
          const Gap(2.0),
          SizedBox(
            width: 100.0,
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
