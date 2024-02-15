

import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/login_page.dart';
import 'package:bankenstein/presentation/pages/settings_page.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: LoginPage.name,
        path: '/login',
        builder: (context, state) {
          return LoginPage();
        },
      ),
      GoRoute(
        name: HomePage.name,
        path: '/home',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: SettingsPage.name,
        path: '/settings',
        builder: (context, state) {
          return const SettingsPage();
        },
      )
    ],
  );
}
