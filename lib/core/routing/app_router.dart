import 'package:e_commerce/core/di/dependancy_injection.dart';
import 'package:e_commerce/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/login/ui/login.dart';
import 'package:e_commerce/features/auth/register/logic/cubit/register_cubit.dart';
import 'package:e_commerce/navigation_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/register/ui/register_screen.dart';
import '../../features/home/data/models/product_model.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/product_details/product_details.dart';
import 'routes_names.dart';

class AppRouter {
  static final generateRoute = GoRouter(
    initialLocation: RoutesNames.navigation,
    routes: [
      GoRoute(
        path: RoutesNames.productDetails,
        name: RoutesNames.productDetails,
        builder: (context, state) {
          final productModel = state.extra as ProductModel;
          return ProductDetailsScreen(productModel: productModel);
        },
      ),
      GoRoute(
        path: RoutesNames.navigation,
        name: RoutesNames.navigation,
        builder: (context, state) => BlocProvider(
          create: (context) => getIt<HomeCubit>()..getCategories(),
          child: const NavigationScreen(),
        ),
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
