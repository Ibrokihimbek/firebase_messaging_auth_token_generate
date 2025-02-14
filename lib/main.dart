import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:fcm_send_token_generate/core/theme/theme.dart';
import 'package:fcm_send_token_generate/feature/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      builder: (light, dark) {
        return MaterialApp(
          title: 'Json to Token',
          debugShowCheckedModeBanner: false,
          theme: light,
          darkTheme: dark,
          home: const HomePage(),
        );
      },
      initial: AdaptiveThemeMode.light,
    );
  }
}

/// To get project id, go to:
/// https://console.cloud.google.com/projectselector2/settings/general
