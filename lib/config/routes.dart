// routes.dart
import "package:flutter/cupertino.dart";
import "package:go_router/go_router.dart";
import "package:iklc_anime_verse/screens/signin_screen.dart";

import "../screens/detail_screen.dart";
import "../screens/favorite_screen.dart";
import "../screens/home_screen.dart";
import "../screens/profile_screen.dart";
import "../widgets/bottom_navigation_shell.dart";

class AppRoutes {
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String home = '/home';
  static const String favorites = '/favorites';
  static const String profile = '/profile';
  static const String details = '/details';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createRouter() {
  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AppRoutes.signIn,
      routes: [
        // Sign In Route
        GoRoute(
          path: AppRoutes.signIn,
          name: 'sign-in',
          builder: (context, state) => const SignInScreen(),
        ),

        // Detail Route
        GoRoute(
          path: '${AppRoutes.details}/:id',
          name: 'detail',
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state) {
            final animeId = state.pathParameters['id'] ?? '';
            return DetailScreen(id: animeId);
          },
        ),

        // Shell Route for Home, Favorites, and Profile
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return BottomNavigationShell(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.home,
                  name: 'home',
                  builder: (context, state) => const HomeScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.favorites,
                  name: 'favorites',
                  builder: (context, state) => const FavoriteScreen(),
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: AppRoutes.profile,
                  name: 'profile',
                  builder: (context, state) => const ProfileScreen(),
                )
              ],
            ),
          ],
        ),
      ]
  );
}
