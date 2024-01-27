import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
  GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> homeNavKey =
  GlobalKey(debugLabel: 'matchesNavKey');
  static GlobalKey<NavigatorState> matchesNavKey =
  GlobalKey(debugLabel: 'matchesNavKey');
  static GlobalKey<NavigatorState> newsNavKey =
  GlobalKey(debugLabel: 'newsNavKey');
  static GlobalKey<NavigatorState> tournamentsNavKey =
  GlobalKey(debugLabel: 'tournamentsNavKey');
  static GlobalKey<NavigatorState> favoritesNavKey =
  GlobalKey(debugLabel: 'favoritesNavKey');
  static GlobalKey<NavigatorState> moreNavKey =
  GlobalKey(debugLabel: 'moreNavKey');
}