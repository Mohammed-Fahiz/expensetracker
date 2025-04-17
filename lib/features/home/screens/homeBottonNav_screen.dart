import 'package:expensetracker/core/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomNavScreen extends ConsumerWidget {
  final Widget child;

  const HomeBottomNavScreen({super.key, required this.child});

  static final List<String> _tabs = [
    '/personList',
    '/add-category',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String location = GoRouterState.of(context).uri.toString();
    final int currentIndex =
        _tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: child, // Use the router's child here
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 0.02.sw,
          right: 0.02.sw,
          bottom: 0.01.sh,
        ),
        child: Container(
          height: 0.1.sh,
          padding: EdgeInsets.symmetric(
            horizontal: 0.02.sw,
            vertical: 0.02.sh,
          ),
          decoration: BoxDecoration(
            color: AppThemes.lightSurface,
            borderRadius: BorderRadius.circular(0.05.sw),
          ),
          child: GNav(
            tabBackgroundColor: AppThemes.darkestBlue,
            rippleColor: Colors.grey[800]!,
            hoverColor: Colors.grey[700]!,
            haptic: true,
            tabBorderRadius: 5,
            tabActiveBorder: Border.all(color: Colors.black, width: 2),
            tabBorder: Border.all(color: Colors.grey, width: 1),
            curve: Curves.easeOutExpo,
            duration: const Duration(milliseconds: 400),
            gap: 8,
            color: AppThemes.darkestBlue,
            activeColor: AppThemes.lightSurface,
            textStyle: const TextStyle(color: AppThemes.lightSurface),
            iconSize: 0.065.sw,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            selectedIndex: currentIndex < 0 ? 0 : currentIndex,
            onTabChange: (index) {
              context.go(_tabs[index]);
            },
            tabs: const [
              GButton(icon: LineIcons.creditCard, text: 'Lend/Borrow'),
              GButton(icon: LineIcons.list, text: 'Categories'),
            ],
          ),
        ),
      ),
    );
  }
}
