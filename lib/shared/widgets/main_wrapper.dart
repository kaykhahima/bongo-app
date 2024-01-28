import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_body.dart';
import 'blurred_bottom_nav.dart';
import 'bottom_nav.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key, required this.navShell, required this.state});

  final GoRouterState state;
  final StatefulNavigationShell navShell;

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: AppBody(navShell: widget.navShell),
      bottomNavigationBar: BottomNav(navShell: widget.navShell),
      // bottomNavigationBar: BlurredBottomBar(navShell: widget.navShell),
    );
  }
}
