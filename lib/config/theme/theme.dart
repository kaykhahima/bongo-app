import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = darkAppTheme;
  static ThemeData light = lightAppTheme;
}

final ThemeData darkAppTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xffc22033),
    primaryContainer: Color(0xff7b1421),
    secondary: Color(0xffc22033),
    secondaryContainer: Color(0xff7b1421),
    tertiary: Color(0xffc22033),
    tertiaryContainer: Color(0xff7b1421),
    appBarColor: Color(0xff7b1421),
    error: Color(0xffcf6679),
  ),
  surfaceMode: FlexSurfaceMode.highScaffoldLowSurfacesVariantDialog,
  blendLevel: 2,
  subThemesData: const FlexSubThemesData(
    interactionEffects: false,
    tintedDisabledControls: false,
    useTextTheme: true,
    defaultRadius: 10.0,
    elevatedButtonSecondarySchemeColor: SchemeColor.surface,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    inputDecoratorUnfocusedBorderIsColored: false,
    chipSelectedSchemeColor: SchemeColor.primary,
    popupMenuRadius: 8.0,
    popupMenuSchemeColor: SchemeColor.onPrimary,
    alignedDropdown: true,
    tooltipRadius: 4,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    useInputDecoratorThemeInDialogs: true,
    snackBarElevation: 6,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    drawerSelectedItemSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.outline,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarBackgroundSchemeColor: SchemeColor.primaryContainer,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: 'Inter',
);

final ThemeData lightAppTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xffc22033),
    primaryContainer: Color(0xffe39ba3),
    secondary: Color(0xffc22033),
    secondaryContainer: Color(0xffe39ba3),
    tertiary: Color(0xffc22033),
    tertiaryContainer: Color(0xffe39ba3),
    appBarColor: Color(0xffe39ba3),
    error: Color(0xffb00020),
  ),
  appBarStyle: FlexAppBarStyle.primary,
  subThemesData: const FlexSubThemesData(
    interactionEffects: false,
    tintedDisabledControls: false,
    blendOnColors: false,
    useTextTheme: true,
    defaultRadius: 10.0,
    elevatedButtonSecondarySchemeColor: SchemeColor.surface,
    outlinedButtonOutlineSchemeColor: SchemeColor.primary,
    segmentedButtonSchemeColor: SchemeColor.primary,
    segmentedButtonUnselectedForegroundSchemeColor: SchemeColor.primary,
    segmentedButtonBorderSchemeColor: SchemeColor.primary,
    inputDecoratorUnfocusedBorderIsColored: false,
    chipSelectedSchemeColor: SchemeColor.primary,
    popupMenuRadius: 8.0,
    popupMenuSchemeColor: SchemeColor.onPrimary,
    alignedDropdown: true,
    tooltipRadius: 4,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    useInputDecoratorThemeInDialogs: true,
    snackBarElevation: 6,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    tabBarItemSchemeColor: SchemeColor.onPrimary,
    tabBarUnselectedItemSchemeColor: SchemeColor.primaryContainer,
    drawerIndicatorSchemeColor: SchemeColor.primary,
    drawerSelectedItemSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.outline,
    bottomNavigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.outline,
    bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
    bottomNavigationBarOpacity: 0.00,
    bottomNavigationBarElevation: 22.0,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.primary,
    navigationBarIndicatorOpacity: 1.00,
    navigationBarBackgroundSchemeColor: SchemeColor.primaryContainer,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onPrimary,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.primary,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  useMaterial3ErrorColors: true,
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  fontFamily: 'Inter',
);
