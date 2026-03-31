import 'package:e_commerce/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/login/ui/login.dart';
import 'package:e_commerce/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_commerce/features/navigation_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/register/ui/register_screen.dart';
import 'routes_names.dart';

class AppRouter {
  static final generateRoute = GoRouter(
    initialLocation: '/navigation',
    routes: [
      GoRoute(
        path: RoutesNames.navigation,
        name: RoutesNames.navigation,
        builder: (context, state) => const NavigationScreen(),
      ),
      GoRoute(
        path: RoutesNames.login,
        name: RoutesNames.login,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => LoginCubit(),
            child: const Login(),
          );
        },
      ),
      GoRoute(
        path: RoutesNames.register,
        name: RoutesNames.register,
        builder: (context, state) {
          return BlocProvider(
            create: (context) => RegisterCubit(),
            child: const Register(),
          );
        },
      ),
    ],
  );
}
