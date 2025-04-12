import 'package:expensetracker/features/auth/screens/splash_screen.dart';
import 'package:expensetracker/features/categories/screens/listCategory_screen.dart';
import 'package:expensetracker/features/home/screens/homeBottonNav_screen.dart';
import 'package:expensetracker/features/lend-borrow/screens/lendBorrow_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) => HomeBottomNavScreen(child: child),
      routes: [
        GoRoute(
          path: '/lend-borrow',
          builder: (context, state) => const LendBorrowScreen(),
        ),
        GoRoute(
          path: '/add-category',
          builder: (context, state) => const ListCategoryScreen(),
        ),
      ],
    ),
  ],
);
