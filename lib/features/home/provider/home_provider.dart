import 'package:bongo_app/features/home/models/event.dart';
import 'package:bongo_app/utils/constants.dart';
import 'package:flutter/material.dart';

import '../models/main_activity.dart';
import '../models/movie.dart';

class HomeProvider extends ChangeNotifier {
  final List<MainActivity> _mainActivities = [
    const MainActivity(title: 'Movies', icon: Icons.live_tv_outlined),
    const MainActivity(title: 'Food', icon: Icons.fastfood_outlined),
    const MainActivity(title: 'Parties', icon: Icons.celebration_outlined),
    const MainActivity(title: 'Events', icon: Icons.calendar_month_outlined),
  ];

  final List<Event> _events = [
    Event(
        name: 'Hello Jua',
        date: DateTime.now().add(const Duration(days: 6)),
        location: 'Wavuvi Kempu + Samaki Samaki',
        imagePath: AssetConstants.helloJua),
    Event(
        name: 'Sensation',
        date: DateTime.now().add(const Duration(days: 4)),
        location: 'Mbezi',
        imagePath: AssetConstants.sensation),
    Event(
        name: 'Overdose Night',
        date: DateTime.now().add(const Duration(days: 1)),
        location: 'Tabata',
        imagePath: AssetConstants.overdoseNight),
    Event(
        name: 'Accoustic Groves',
        date: DateTime.now().add(const Duration(days: 12)),
        location: 'Samaki Samaki',
        imagePath: AssetConstants.acousticGrooves),
    Event(
        name: 'The Big Hangout',
        date: DateTime.now().add(const Duration(days: 15)),
        location: 'Samaki Samaki',
        imagePath: AssetConstants.theBigHangout),
  ];

  final List<Movie> _movies = [
    Movie(
      title: 'Avatar',
      posterPath: AssetConstants.avatar,
      genres: ['Sci-fi', 'Action'],
      isNowShowing: false,
      isTrending: false,
    ),
    Movie(
      title: 'Oppenheimer',
      posterPath: AssetConstants.oppenheimer,
      genres: ['Thriller'],
      isNowShowing: true,
      isTrending: true,
    ),
    Movie(
      title: 'Blue Beetle',
      posterPath: AssetConstants.blueBeetle,
      genres: ['Action', 'Sci-fi'],
      isNowShowing: true,
      isTrending: false,
    ),
    Movie(
      title: 'Godzilla Minus One',
      posterPath: AssetConstants.godzillaMinusOne,
      genres: ['Action', 'Sci-fi'],
      isNowShowing: false,
      isTrending: true,
    ),
    Movie(
      title: 'Migration',
      posterPath: AssetConstants.migration,
      genres: ['Comedy', 'Adventure'],
      isNowShowing: true,
      isTrending: false,
    ),
    Movie(
      title: 'Spiderman: Across the Spiderverse',
      posterPath: AssetConstants.spiderman,
      genres: ['Action', 'Comedy'],
      isNowShowing: false,
      isTrending: true,
    ),
    Movie(
      title: 'The Batman',
      posterPath: AssetConstants.theBatman,
      genres: ['Action', 'Crime'],
      isNowShowing: false,
      isTrending: true,
    ),
    Movie(
      title: 'The Marvels',
      posterPath: AssetConstants.theMarvels,
      genres: ['Action', 'Adventure'],
      isNowShowing: true,
      isTrending: true,
    ),
  ];

  List<MainActivity> get mainActivities => _mainActivities;

  List<Event> get events => _events;

  List<Movie> get movies => _movies;

  List<Movie> get trendingMovies =>
      _movies.where((movie) => movie.isTrending).toList();

  List<Movie> get nowShowingMovies =>
      _movies.where((movie) => movie.isNowShowing).toList();
}
