// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/helpers/spacing.dart';
import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/custom_button.dart';
import '../logic/cubit/register_cubit.dart';
import 'widgets/register_bloc_listener.dart';
import 'widgets/register_form.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  'Register to your account',
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
                RegisterForm(),
                verticalSpace(
                  25,
                ),
                CustomButton(
                  onPressed: () {
                    if (context
                        .read<RegisterCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<RegisterCubit>().myemit();
                    }
                  },
                  text: 'Create Account',
                ),
                const RegisterBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
