import 'package:expensetracker/core/routing/routes.dart';
import 'package:expensetracker/core/theme/theme.dart';
import 'package:expensetracker/features/auth/screens/splash_screen.dart';
import 'package:expensetracker/features/home/screens/homeBottonNav_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true, // auto adapt text
      splitScreenMode: true,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: true,
        theme: AppThemes.lightTheme,
        routerConfig: router,
      ),
    );
  }
}
