// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_commerce/core/util/validation_util.dart';
import 'package:e_commerce/features/auth/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/routes_names.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  var state = 'still check';
  @override
  void initState() {
    _email.addListener(() => setState(() {}));
    _password.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                ListTile(
                  title: Text("Hello, again 👋"),
                  titleTextStyle: TextStyle(
                    letterSpacing: 1,
                    fontSize: 20,
                    color: Colors.white54,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitleTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                    fontWeight: FontWeight.w500,
                  ),
                  subtitle: Text("Login to your account ..."),
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  controller: _email,
                  hint: 'example@gmail.com',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'fill the email field';
                    } else if (!ValidationUtil.isValidUserEmail(value)) {
                      return 'Email isn\'t true';
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 25,
                ),
                CustomTextField(
                  obscureText: true,
                  controller: _password,
                  hint: 'password',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'fill the password field';
                    } else if (value.length < 6) {
                      return 'password should be at least 6 characters';
                    }
                    return null;
                  },
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  suffixIcon: Icon(
                    Icons.remove_red_eye_rounded,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor:
                            (_email.text == '' || _password.text == '')
                                ? Colors.grey
                                : Colors.blue),
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          state = 'call servier';
                          context.pushNamed(RoutesNames.login);
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
