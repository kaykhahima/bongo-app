import 'package:bongo_app/features/home/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MovieCover extends StatelessWidget {
  const MovieCover({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          movie.posterPath,
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          child: Container(
            height: (MediaQuery.of(context).size.height * 0.4) + kToolbarHeight,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              gradient: LinearGradient(
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.surface.withOpacity(0.0),
                    Theme.of(context).colorScheme.surface.withOpacity(0.8),
                    Theme.of(context).colorScheme.surface,
                  ],
                  stops: const [
                    0.0,
                    0.5,
                    1.0,
                  ]),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  const Gap(8.0),
                  Text(
                    movie.synopsis,
                  ),
                  const Gap(8.0),
                  Row(
                    children: [
                      Text(
                        movie.genres.map((g) => g).join(', '),
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.0,
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                      const Gap(5.0),
                      Icon(
                        Icons.circle,
                        size: 4.0,
                        color: Theme.of(context)
                            .colorScheme
                            .outline
                            .withOpacity(0.5),
                      ),
                      const Gap(5.0),
                      Text(
                        '${movie.rating.toString()}/10',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Theme.of(context).colorScheme.outline,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  const Gap(16.0),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
