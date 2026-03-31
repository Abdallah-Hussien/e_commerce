import 'package:e_commerce/core/helpers/extension.dart';
import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:e_commerce/core/theme/style_manager.dart';
import 'package:e_commerce/core/util/validation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theme/color_manager.dart';
import '../../../../../core/widgets/app_form_text_field.dart';
import '../../logic/cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordHiden = true;
  bool isConfirmPasswordHiden = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'User Name',
            style: StyleManager.dark16Medium,
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            controller: context.read<RegisterCubit>().name,
            hint: 'Enter your full name',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Fill the Name field';
              }
              return null;
            },
          ),
          verticalSpace(
            16,
          ),
          Text(
            'User Email',
            style: StyleManager.dark16Medium,
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            controller: context.read<RegisterCubit>().email,
            hint: 'example@gmail.com',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Fill the Email field';
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
            style: StyleManager.dark16Medium,
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            obscureText: isPasswordHiden,
            controller: context.read<RegisterCubit>().password,
            hint: 'password',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Fill the Password field';
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
          verticalSpace(16),
          Text(
            'Confirm Password',
            style: StyleManager.dark16Medium,
          ),
          verticalSpace(
            4,
          ),
          AppFormTextField(
            obscureText: isConfirmPasswordHiden,
            controller: context.read<RegisterCubit>().confirmPassword,
            hint: 'confirm password',
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return 'Fill the Confirm Password field';
              } else if (value != context.read<RegisterCubit>().password.text) {
                return 'Password doesn\'t match';
              }
              return null;
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isConfirmPasswordHiden = !isConfirmPasswordHiden;
                });
              },
              child: Icon(
                isConfirmPasswordHiden
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
