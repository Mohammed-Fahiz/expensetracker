import 'package:expensetracker/features/auth/screens/splash_screen.dart';
import 'package:expensetracker/features/categories/screens/addCategory_screen.dart';
import 'package:expensetracker/features/home/screens/homeBottonNav_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Define routes with paths matching bottom navigation indexes
final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeBottomNavScreen(),
    ),
    GoRoute(
      path: '/add-category',
      builder: (context, state) => const AddCategoryScreen(),
    ),
  ],
);
