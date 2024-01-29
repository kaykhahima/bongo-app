class Movie {
  final String title;
  final String posterPath;
  final List<String> genres;
  final String synopsis;
  final double rating;
  final bool isNowShowing;
  final bool isTrending;
  final List<DateTime> datesAiring;
  final List<MovieVenue> venues;

  Movie({
    required this.title,
    required this.posterPath,
    required this.genres,
    required this.synopsis,
    required this.rating,
    required this.isNowShowing,
    required this.isTrending,
    required this.datesAiring,
    required this.venues,
  });
}

class MovieVenue {
  final String location;
  final String movieType;
  final List<DateTime> timesShowing;

  MovieVenue({
    required this.location,
    required this.movieType,
    required this.timesShowing,
  });
}
