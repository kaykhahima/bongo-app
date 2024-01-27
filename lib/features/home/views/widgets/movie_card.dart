import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
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
            height: 120.0,
            width: 100.0,
          ),
        ),
        SizedBox(
          width: 100.0,
          child: Text(
            movie.genres.map((g) => g).join(', '),
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
          width: 100.0,
          child: Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 12.0,
                ),
          ),
        ),
      ],
    );
  }
}
