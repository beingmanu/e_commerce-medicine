import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/theme.dart';
import 'core/app_providers.dart';
import 'screens/auth/splash_screen.dart';

AppThemeData theme = AppThemeData();
Future<void> main() async {
  theme.init(false);

  runApp(
    MultiProvider(
      providers: appProviders,
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppThemeData(),
      child: Consumer<AppThemeData>(
        builder: (context, value, child) {
          var mainTheme = ThemeData(
              primarySwatch: value.primarySwatch,
              brightness: Brightness.light,
              primaryColor: value.primaryColor);
          if (value.darkMode) {
            mainTheme = ThemeData(
                primarySwatch: value.primarySwatch,
                brightness: Brightness.dark,
                primaryColor: value.primaryColor);
          }
          return MaterialApp(
            theme: mainTheme,
            title: "Medicine_app",
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
