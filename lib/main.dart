import 'package:bongo_app/shared/providers_list.dart';
import 'package:bongo_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: providers,
      child: const BongoApp(),
    ),
  );
}

class BongoApp extends StatelessWidget {
  const BongoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bongo App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: Utils.rootScaffoldMessengerKey,
      routeInformationProvider: AppRoutes.router.routeInformationProvider,
      routeInformationParser: AppRoutes.router.routeInformationParser,
      routerDelegate: AppRoutes.router.routerDelegate,
    );
  }
}
