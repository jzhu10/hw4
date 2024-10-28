import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hw4/blocs/authentication/bloc/authentication_bloc.dart';
import 'package:hw4/utilities/steam_to_listenable.dart';
import 'package:hw4/widgets/scaffold_with_nav_bar.dart';
import 'package:hw4/pages/router_by_author.dart';
import 'package:hw4/pages/router_by_author_detail.dart';
import 'package:hw4/pages/router_by_title.dart';
import 'package:hw4/pages/router_by_title_detail.dart';
import 'package:hw4/pages/router_home.dart';
import 'package:hw4/pages/router_login.dart';
import 'package:hw4/pages/router_profile.dart';

class RouteName {
  static const home = 'home';
  static const byAuthor = 'byAuthor';
  static const byAuthorDetail = 'byAuthorDetail';
  static const byTitle = 'byTitle';
  static const byTitleDetail = 'byTitleDetail';
  static const profile = 'profile';
  static const login = 'login';
}

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'Shell');

GoRouter bookclubRouter(AuthenticationBloc authenticationBloc) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: '/byAuthor',
    refreshListenable: StreamToListenable([authenticationBloc.stream]),
    redirect: (context, state) async {
      if (authenticationBloc.state is AuthenticationLoggedOut &&
          (!(state.fullPath?.startsWith('/login') ?? false))) {
        return '/login';
      } else if (authenticationBloc.state is AuthenticationLoggedIn &&
          (state.fullPath?.startsWith('/login') ?? false)) {
        return '/byAuthor';
      }
      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        name: RouteName.login,
        builder: (context, state) {
          return const RouterLogin();
        },
      ),
      GoRoute(
        path: '/',
        name: RouteName.home,
        builder: (context, state) => const RouterHome(),
        routes: [
          ShellRoute(
              navigatorKey: shellNavigatorKey,
              builder: (context, state, child) =>
                  ScaffoldWithNavBar(child: child),
              routes: <RouteBase>[
                GoRoute(
                  path: 'byAuthor',
                  name: RouteName.byAuthor,
                  builder: (context, state) => const RouterByAuthor(),
                  routes: [
                    GoRoute(
                      path: 'byAuthorDetail/:index',
                      name: RouteName.byAuthorDetail,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final index = int.parse(state.pathParameters['index']!);
                        return RouterByAuthorDetail(index: index);
                      },
                    )
                  ],
                ),
                GoRoute(
                  path: 'byTitle',
                  name: RouteName.byTitle,
                  builder: (context, state) => const RouterByTitle(),
                  routes: [
                    GoRoute(
                      path: 'byTitleDetail/:index',
                      name: RouteName.byTitleDetail,
                      parentNavigatorKey: rootNavigatorKey,
                      builder: (context, state) {
                        final index = int.parse(state.pathParameters['index']!);
                        return RouterByTitleDetail(index: index);
                      },
                    )
                  ],
                ),
                GoRoute(
                  path: 'profile',
                  name: RouteName.profile,
                  builder: (context, state) => const RouterProfile(),
                )
              ])
        ],
      )
    ],
  );
}
