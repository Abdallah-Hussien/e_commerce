// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/routing/routes_names.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/widgets/loading_layout.dart';
import 'package:e_commerce/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          LoadingLayout.setupLogin(context);
        } else if (state is LoginSuccess) {
          context.pop(context);
          context.pushReplacement(RoutesNames.register);
        } else if (state is LoginFailure) {
          context.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
            ),
          );
        }
      },
      child: SizedBox.shrink(),
    );
  }
}
