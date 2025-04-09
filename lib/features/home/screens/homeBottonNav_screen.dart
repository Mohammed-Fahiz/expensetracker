import 'package:expensetracker/core/theme/theme.dart';
import 'package:expensetracker/features/categories/screens/listCategory_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBottomNavScreen extends ConsumerWidget {
  static const routeName = "/home";
  const HomeBottomNavScreen({super.key});

  static final List<String> _tabs = [
    '/add-category',
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String currentLocation = GoRouterState.of(context).uri.toString();
    final int currentIndex =
        _tabs.indexWhere((path) => currentLocation.startsWith(path));

    return Scaffold(
      body: IndexedStack(
        index: currentIndex == -1 ? 0 : currentIndex,
        children: const [
          ListCategoryScreen(),
        ],
      ),
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
            selectedIndex: currentIndex == -1 ? 0 : currentIndex,
            onTabChange: (index) {
              context.go(_tabs[index]); // Navigate using GoRouter
            },
            tabs: const [
              GButton(icon: LineIcons.home, text: 'Home'),
              GButton(icon: LineIcons.heart, text: 'Likes'),
              GButton(icon: LineIcons.search, text: 'Search'),
              GButton(icon: LineIcons.user, text: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}
