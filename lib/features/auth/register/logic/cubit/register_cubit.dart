import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_state.dart';

class RegisterCubit extends Cubit<BaseState> {
  RegisterCubit() : super(Initial());
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  void myemit() {
    emit(Loading());
    Future.delayed(const Duration(seconds: 3), () {
      emit(Success('data'));
    });
    Future.delayed(const Duration(seconds: 3), () {
      emit(Failure('failed to register'));
    });
  }
}
