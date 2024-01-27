import 'package:bongo_app/features/auth/views/pages/otp_verification_page.dart';
import 'package:bongo_app/features/auth/views/pages/signup_page.dart';
import 'package:bongo_app/features/onboarding/views/pages/onboarding_page.dart';
import 'package:bongo_app/features/profile/views/pages/profile_page.dart';
import 'package:bongo_app/features/tickets/views/pages/tickets_page.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/views/pages/signin_page.dart';
import '../../features/home/views/pages/home_page.dart';
import '../../shared/widgets/main_wrapper.dart';
import '../../utils/utils.dart';

class AppRoutes {
  static String initialRoute = '/';

  static final router = GoRouter(
    navigatorKey: Utils.rootNavKey,
    initialLocation: initialRoute,
    debugLogDiagnostics: true,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navShell) => MainWrapper(
          navShell: navShell,
          state: state,
        ),
        branches: [
          StatefulShellBranch(
            navigatorKey: Utils.matchesNavKey,
            routes: [
              GoRoute(
                path: '/',
                name: 'Home',
                builder: (context, state) => HomePage(key: state.pageKey),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Utils.newsNavKey,
            routes: [
              GoRoute(
                path: '/tickets',
                name: 'Tickets',
                builder: (context, state) => TicketsPage(key: state.pageKey),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: Utils.tournamentsNavKey,
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
        path: '/onboarding',
        name: 'Onboarding',
        builder: (context, state) => OnBoardingPage(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: '/signup',
        name: 'Signup',
        builder: (context, state) => SignUpPage(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: '/signin',
        name: 'Signin',
        builder: (context, state) => SignInPage(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavKey,
        path: '/otp-verification',
        name: 'OtpVerification',
        builder: (context, state) => OtpVerificationPage(key: state.pageKey),
      ),
    ],
  );
}
