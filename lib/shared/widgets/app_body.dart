import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBody extends StatefulWidget {
  const AppBody({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  State<AppBody> createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: widget.navShell,
    );
  }
}
