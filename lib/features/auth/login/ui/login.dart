// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:e_commerce/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import 'widgets/login_form.dart';
import 'widgets/login_bloc_listener.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var state = 'still check';
  // @override
  // void initState() {
  //   _email.addListener(() => setState(() {}));
  //   _password.addListener(() => setState(() {}));
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _email.dispose();
  //   _password.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(
                  59,
                ),
                Text(
                  'Login to your account',
                  style: StyleManager.dark32SmiBold,
                ),
                verticalSpace(
                  8,
                ),
                Text(
                  'It’s great to see you again.',
                  style: StyleManager.lightGray16Regular,
                ),
                verticalSpace(
                  25,
                ),
                LoginForm(),
                verticalSpace(
                  25,
                ),
                CustomButton(
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<LoginCubit>().myemit();
                    }
                  },
                  text: 'Login',
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
