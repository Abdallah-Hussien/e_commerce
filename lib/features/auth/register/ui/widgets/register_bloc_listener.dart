import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/register_cubit.dart';
import '../../logic/cubit/register_state.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, BaseState>(
      listener: (context, state) {
        switch (state) {
          case Initial():
          // / TODO: Handle this case.
          case Loading():
            {
              setupLoginState(context);
            }
          case Success():
          // /TODO: Handle this case.
          case Failure():
            {
              var statee = state as Failure;
              context.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(statee.error),
                ),
              );
            }
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  Future<dynamic> setupLoginState(BuildContext context) {
    return showDialog(
      barrierDismissible: false,
      barrierColor: ColorManager.moreLighterGray.withOpacity(0.7),
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          content: Lottie.asset(
            'assets/lottie/loading.json',
            width: 250,
            height: 250,
          ),
        );
      },
    );
  }
}
