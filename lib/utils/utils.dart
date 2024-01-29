import 'package:flutter/material.dart';

class Utils {
  static GlobalKey<NavigatorState> rootNavKey = GlobalKey();
  static GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static GlobalKey<NavigatorState> homeNavKey =
      GlobalKey(debugLabel: 'homeNavKey');
  static GlobalKey<NavigatorState> ticketsNavKey =
      GlobalKey(debugLabel: 'ticketsNavKey');
  static GlobalKey<NavigatorState> profileNavKey =
      GlobalKey(debugLabel: 'profileNavKey');
}
