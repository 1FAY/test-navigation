import 'package:go_router/go_router.dart';

import '../pages/details_page.dart';
import '../pages/home_page.dart';
import '../pages/login_page.dart';
import '../pages/search_page.dart';
import '../pages/settings_page.dart';
import '../states/app_state.dart';
import 'tabs_scaffold.dart';


GoRouter createRouter(AppState appState) {
  return GoRouter(
    initialLocation: '/home',
    refreshListenable: appState,
    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/login';
      final needsAuth = state.matchedLocation.startsWith('/settings');

      if (!appState.loggedIn && needsAuth && !loggingIn) {
        return '/login?from=${Uri.encodeComponent(state.matchedLocation)}';
      }
      if (appState.loggedIn && loggingIn) {
        return '/home';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => LoginPage(
          onLogin: () {
            appState.login();
            final from = state.uri.queryParameters['from'];
            context.go(from ?? '/home');
          },
        ),
      ),
      ShellRoute(
        builder: (context, state, child) => TabsScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'details/:id',
                name: 'details',
                builder: (context, state) => DetailsPage(
                  id: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: '/settings',
            name: 'settings',
            builder: (context, state) => SettingsPage(
              onLogout: appState.logout,
            ),
          ),
        ],
      ),
    ],
  );
}