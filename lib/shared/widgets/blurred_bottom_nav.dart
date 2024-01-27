import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class BlurredBottomBar extends StatefulWidget {
  const BlurredBottomBar({
    super.key,
    required this.navShell,
  });

  final StatefulNavigationShell navShell;

  @override
  State<BlurredBottomBar> createState() => _BlurredBottomBarState();
}

class _BlurredBottomBarState extends State<BlurredBottomBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bottomNavigationBarTheme = theme.bottomNavigationBarTheme.copyWith(
      backgroundColor: Colors.red,
    );

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: FlexColorScheme.themedSystemNavigationBar(
        context,
        noAppBar: true,
        systemNavBarStyle: FlexSystemNavBarStyle.transparent,
      ),
      child: Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.only(bottom: 32.0),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int i = 0; i < navItems.length; i++)
                  SizedBox(
                    height: 45,
                    child: GestureDetector(
                      onTap: () => _goToBranch(i),
                      child: Column(
                        children: [
                          Icon(
                            navItems[i].icon,
                            color: bottomNavigationBarTheme.unselectedItemColor,
                          ),
                          const Gap(4.0),
                          Text(
                            navItems[i].label,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color:
                                  bottomNavigationBarTheme.unselectedItemColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _goToBranch(int index) {
    widget.navShell.goBranch(
      index,
      initialLocation: index == widget.navShell.currentIndex,
    );
  }
}

class NavItem {
  const NavItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
}

List<NavItem> navItems = [
  NavItem(
    icon: Icons.home_outlined,
    label: 'Home',
    onTap: () {},
  ),
  NavItem(
    icon: Icons.airplane_ticket_outlined,
    label: 'Tickets',
    onTap: () {},
  ),
  NavItem(
    icon: Icons.person_2_outlined,
    label: 'Profile',
    onTap: () {},
  ),
];
