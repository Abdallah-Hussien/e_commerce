import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
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
  final Icon? suffixIcon;
  final TextInputType? textInputType;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      keyboardType: textInputType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
