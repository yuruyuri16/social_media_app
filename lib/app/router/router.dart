import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:social_media_app/app/app.dart';
import 'package:social_media_app/content/content.dart';
import 'package:social_media_app/home/home.dart';
import 'package:social_media_app/login/login.dart';
import 'package:social_media_app/register/register.dart';
import 'package:social_media_app/user_profile/user_profile.dart';

class AppRouter {
  static GoRouter router(AppBloc appbloc) {
    return GoRouter(
      debugLogDiagnostics: true,
      refreshListenable: GoRouterRefreshStream(appbloc.stream),
      redirect: (context, state) {
        final isAuthenticated =
            context.read<AppBloc>().state.status.isAuthenticated;
        if (state.location == '/' && !isAuthenticated) {
          return '/login';
        } else if ((state.location == '/login' ||
                state.location == '/register') &&
            isAuthenticated) {
          return '/';
        }
        return null;
      },
      routes: [
        ShellRoute(
          builder: (context, state, child) {
            return HomePage(child: child);
          },
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const ContentPage(),
            ),
            GoRoute(
              path: '/user-profile',
              builder: (context, state) => const UserProfilePage(),
            )
          ],
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          builder: (context, state) => const RegisterPage(),
        )
      ],
    );
  }
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (dynamic _) => notifyListeners(),
        );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
