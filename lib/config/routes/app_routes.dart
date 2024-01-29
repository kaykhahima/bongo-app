import 'package:bongo_app/features/home/models/movie.dart';
import 'package:bongo_app/features/home/views/pages/movie_booking.dart';
import 'package:bongo_app/features/home/views/pages/movies_page.dart';
import 'package:bongo_app/features/home/views/pages/payment_page.dart';
import 'package:bongo_app/features/home/views/pages/seat_selection_page.dart';
import 'package:bongo_app/features/profile/profile_page.dart';
import 'package:bongo_app/features/tickets/tickets_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/views/pages/home_page.dart';
import '../../shared/widgets/main_wrapper.dart';
import '../../utils/utils.dart';

class AppRoutes {
  static String initialRoute = '/';

  static final router = GoRouter(
    navigatorKey: Utils.rootNavKey,
    initialLocation: initialRoute,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) => MainWrapper(
          navShell: navShell,
          state: state,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: Utils.homeNavKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'Home',
                builder: (context, state) => HomePage(key: state.pageKey),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Utils.ticketsNavKey,
            routes: [
              GoRoute(
                path: '/tickets',
                name: 'Tickets',
                builder: (context, state) => TicketsPage(key: state.pageKey),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Utils.profileNavKey,
            routes: [
              GoRoute(
                path: '/profile',
                name: 'Profile',
                builder: (context, state) => ProfilePage(key: state.pageKey),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: '/movies',
        name: 'movies',
        builder: (context, state) => MoviesPage(key: state.pageKey),
        routes: [
          GoRoute(
            path: 'movie-booking',
            name: 'movie-booking',
            builder: (context, state) {
              Movie movie = state.extra as Movie;
              return MovieBooking(movie: movie);
            },
          ),
          GoRoute(
            path: 'seat-selection',
            name: 'seat-selection',
            builder: (context, state) {
              Movie movie = state.extra as Movie;
              return SeatSelectionPage(movie: movie);
            },
          ),
          GoRoute(
            path: 'payment',
            name: 'payment',
            builder: (context, state) => const PaymentPage(),
          ),
        ],
      ),
    ],
  );
}
