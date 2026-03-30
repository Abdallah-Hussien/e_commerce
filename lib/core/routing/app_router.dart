import 'package:e_commerce/features/auth/login/login.dart';
import 'package:go_router/go_router.dart';

import 'routes_names.dart';

class AppRouter {
  static final generateRoute = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: RoutesNames.login,
        name: RoutesNames.login,
        builder: (context, state) {
          return const Login();
        },
      ),
    ],
  );
}
