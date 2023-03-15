import 'package:go_router/go_router.dart';
import 'package:social_media_app/login/login.dart';
import 'package:social_media_app/register/register.dart';

class AppRouter {
  static GoRouter get router {
    return GoRouter(
      initialLocation: '/login',
      debugLogDiagnostics: true,
      // redirect: (context, state) {
      //   final isAuthenticated =
      //       context.watch<AppBloc>().state.status.isAuthenticated;
      //   if (isAuthenticated) {}
      //   return null;
      // },
      routes: [
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
