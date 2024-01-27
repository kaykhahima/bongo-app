class Movie {
  final String title;
  final String posterPath;
  final List<String> genres;
  final bool isNowShowing;
  final bool isTrending;

  Movie({
    required this.title,
    required this.posterPath,
    required this.genres,
    required this.isNowShowing,
    required this.isTrending,
  });
}
