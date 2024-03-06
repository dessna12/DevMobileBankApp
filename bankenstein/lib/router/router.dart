

import 'package:bankenstein/bloc/authentication_cubit.dart';
import 'package:bankenstein/presentation/pages/home_page.dart';
import 'package:bankenstein/presentation/pages/login_page.dart';
import 'package:bankenstein/presentation/pages/settings_page.dart';
import 'package:bankenstein/presentation/pages/wallet_page.dart';
import 'package:bankenstein/router/go_route_refresh_stream.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/widgets.dart';

const _login = '/login';
const _homePage = '/home';
const _settings = '/settings';


abstract class AppRouter {
  static final _publicRoutes = [
    _login,
  ];
  static GoRouter router(BuildContext context) => GoRouter(
        refreshListenable:
            GoRouterRefreshStream(context.read<AuthenticationCubit>().stream),
        redirect: (context, state) {
          final currentState = context.read<AuthenticationCubit>().state;
          final currentRoute = state.uri.toString();

          if (currentState is AuthenticationStateAuthenticated &&
              currentRoute == _login) {
            return _homePage;
          } else if (!_publicRoutes.contains(currentRoute) &&
              currentState is AuthenticationStateInitial) {
            return _login;
          }
          return null;
        },
        initialLocation: _login,
       routes: [
          GoRoute(
            name: LoginPage.name,
            path: _login,
            builder: (context, state) {
              return LoginPage();
            },
          ),
          GoRoute(
            name: HomePage.name,
            path: _homePage,
            builder: (context, state) {
              return const HomePage();
            },
          ),
          GoRoute(
            name: SettingsPage.name,
            path: _settings,
            builder: (context, state) {
              return const SettingsPage();
            },
          ),
          GoRoute(
            name: WalletPage.name,
            path: _settings,
            builder: (context, state) {
              return const WalletPage();
            },
          )
    ],
  );
}
