import 'package:expensetracker/core/custom_widgets/loader.dart';
import 'package:expensetracker/features/categories/screens/listCategory_screen.dart';
import 'package:expensetracker/features/home/screens/homeBottonNav_screen.dart';
import 'package:expensetracker/features/lend-borrow/screens/lendBorrow_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    _navigateToHomeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Loader(),
    );
  }

  Future<void> _navigateToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    context.go(LendBorrowScreen.routeName);
  }
}
