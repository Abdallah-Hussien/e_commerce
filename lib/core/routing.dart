// ignore_for_file: prefer_const_constructors

import 'package:e_commerce/features/auth/login/login.dart';
import 'package:go_router/go_router.dart';

class Routing {
  static final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) {
          return Login();
        },
      ),
    ],
  );
}
