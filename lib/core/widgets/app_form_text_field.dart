import 'package:e_commerce/core/theme/color_manager.dart';
import 'package:e_commerce/core/theme/font_weight_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppFormTextField extends StatelessWidget {
  const AppFormTextField({
    super.key,
    required this.controller,
    this.hint,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.textInputType,
    this.obscureText = false,
  });

  final TextEditingController controller;
  final String? hint;
  final String? Function(String?)? validator;
  final Icon? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 15.w,
        ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          color: ColorManager.lightGray,
          fontSize: 16.sp,
          fontWeight: FontWeightHelper.regular,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorManager.moreLighterGray),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorManager.moreLighterGray),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorManager.moreLighterGray),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: ColorManager.moreLighterGray),
        ),
      ),
    );
  }
}
