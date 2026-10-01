import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../config/routes.dart';

class BottomNavigationShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const BottomNavigationShell({
    super.key,
    required this.navigationShell,
  });

  void _onItemTapped(BuildContext context, int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final currentIndex = navigationShell.currentIndex;
    
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (navigationShell.currentIndex == 0) {
          Navigator.of(context).pop();
        } else {
          navigationShell.goBranch(0);
        }
      },
        child: SafeArea(
          top: false,
            child: Scaffold(
                body: navigationShell,
                extendBody: true,
                bottomNavigationBar: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: 0,
                    ),
                    padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0b395e),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(context, Icons.home_rounded, 'Home', 0, currentIndex, screenWidth, screenHeight),
                        _buildNavItem(context, Icons.favorite_rounded, 'Favorites', 1, currentIndex, screenWidth, screenHeight),
                        _buildNavItem(context, Icons.person_rounded, 'Profile', 2, currentIndex, screenWidth, screenHeight),
                      ],
                    )
                )
            )
        ),
    );
  }

  Widget _buildNavItem(BuildContext context, IconData icon, String label, int index, int currentIndex, double screenWidth, double screenHeight) {
  final isActive = index == currentIndex;
  return isActive?GestureDetector(
    onTap: () => _onItemTapped(context, index),
    child: Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.025,
        vertical: screenHeight * 0.045,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
        color: const Color(0xff092c47),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.3),
            blurRadius: screenWidth * 0.02,
            offset: Offset(0, screenHeight * 0.005),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: screenWidth * 0.06),
          SizedBox(width: screenWidth * 0.02),
          Text(label, style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.04, fontWeight: FontWeight.w700))
        ]
      ),
    ),
  ):GestureDetector(
    onTap: () => _onItemTapped(context, index),
    child: Padding(padding: EdgeInsets.all(screenWidth * 0.02),
      child: Icon(icon, color: Colors.grey.shade600, size: screenWidth * 0.06),
    ),
  );
}
}