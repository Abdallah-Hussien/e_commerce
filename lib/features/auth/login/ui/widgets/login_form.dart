import 'package:e_commerce/core/helpers/extension.dart';
import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:e_commerce/core/util/validation_util.dart';
import 'package:e_commerce/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_form_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordHiden = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Name',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            controller: context.read<LoginCubit>().email,
            hint: 'example@gmail.com',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'fill the email field';
              } else if (!ValidationUtil.isValidUserEmail(value!)) {
                return 'Email isn\'t true';
              }
              return null;
            },
            textInputType: TextInputType.emailAddress,
          ),
          verticalSpace(
            16,
          ),
          Text(
            'Password',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeightHelper.medium,
            ),
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            obscureText: isPasswordHiden,
            controller: context.read<LoginCubit>().password,
            hint: 'password',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'fill the password field';
              } else if (value!.length < 6) {
                return 'password should be at least 6 characters';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordHiden = !isPasswordHiden;
                });
              },
              child: Icon(
                isPasswordHiden
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
                color: ColorManager.mainDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
