import 'package:expensetracker/core/theme/routing/routes.dart';
import 'package:expensetracker/core/theme/theme.dart';
import 'package:expensetracker/features/auth/screens/splash_screen.dart';
import 'package:expensetracker/features/home/screens/homeBottonNav_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      routerConfig: router,
    );
  }
}
