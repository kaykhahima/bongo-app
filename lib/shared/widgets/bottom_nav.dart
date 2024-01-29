import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.navShell});

  final StatefulNavigationShell navShell;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  _goToBranch(int index) {
    widget.navShell.goBranch(
      index,
      initialLocation: index == widget.navShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: widget.navShell.currentIndex,
        selectedFontSize: 13,
        unselectedFontSize: 13,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            _goToBranch(index);
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
